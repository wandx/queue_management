import 'dart:async';
import 'dart:isolate';

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:queue_management/queue_management.dart';
import 'package:queue_management/src/data/sources/local/job_local.dart';

enum QueueStatus {
  idle,
  running,
  completed,
  completedWithError,
}

class QueueStatusEntity extends Equatable {
  QueueStatusEntity({
    required this.status,
    required this.completed,
  });

  factory QueueStatusEntity.running() {
    return QueueStatusEntity(
      status: QueueStatus.running,
      completed: [],
    );
  }

  factory QueueStatusEntity.completed(List<String> ids) {
    return QueueStatusEntity(
      status: QueueStatus.completed,
      completed: ids,
    );
  }

  factory QueueStatusEntity.completedWithError() {
    return QueueStatusEntity(
      status: QueueStatus.completedWithError,
      completed: [],
    );
  }

  final QueueStatus status;
  final List<String> completed;

  @override
  // TODO: implement props
  List<Object?> get props => [
        status,
        completed,
      ];
}

final queueStatusController = StreamController<QueueStatusEntity>.broadcast();

final

    /// {@template queue_management}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class QueueManagement {
  /// {@macro queue_management}
  QueueManagement._();

  static final instance = QueueManagement._();

  List<JobExecutionContract> jobs = [];

  Future<void> initialize() async {
    final path = await getApplicationDocumentsDirectory();
    Hive
      ..init('${path.path}/hive')
      ..registerAdapter(JobDtoImplAdapter());
  }

  Future<void> addJobQueue(String name, Map<String, dynamic> payload) async {
    final local = JobLocal();
    await local.add(name: name, payload: payload);
  }

  Future<List<Job>> allJobs() async {
    final local = JobLocal();
    final allJobs = await local.browse();
    return allJobs.map((e) => e.toEntity).toList();
  }

  Future<void> clearCompletedJobs() async {
    final local = JobLocal();
    await local.clearCompleted();
  }

  Future<void> clearAllJobs() async {
    final local = JobLocal();
    await local.clearAll();
  }

  Future<void> run() async {
    if (jobs.isEmpty) return;
    final local = JobLocal();
    final allPendingJobs = await local.browsePending();
    final dir = await getApplicationDocumentsDirectory();

    if (allPendingJobs.isEmpty) return;

    queueStatusController.sink.add(QueueStatusEntity.running());

    final completedIds = <String>[];
    final errorIds = <String>[];
    for (final pendingJob in allPendingJobs) {
      for (final job in jobs) {
        if (job.name == pendingJob.name) {
          try {
            final receivePort = ReceivePort();
            job.payload = pendingJob.payload;
            print('syncing');
            await Isolate.spawn(
              _executeJob,
              [
                receivePort.sendPort,
                job,
              ],
              onError: receivePort.sendPort,
              onExit: receivePort.sendPort,
            ).then((e) {
              e.errors.listen((e) {
                print(e.toString());
              });
            });

            completedIds.add(pendingJob.id);
          } catch (e) {
            errorIds.add(pendingJob.id);
            print(e.toString());
          }
        }
      }
    }

    if (completedIds.isNotEmpty && errorIds.isEmpty) {
      for (final id in completedIds) {
        await local.markAsCompleted(id);
      }
      queueStatusController.sink.add(QueueStatusEntity.completed(completedIds));
    } else {
      queueStatusController.sink.add(QueueStatusEntity.completedWithError());
    }
  }
}

void _executeJob(List<dynamic> args) {
  final port = args[0] as SendPort;
  try {
    final job = args[1] as JobExecutionContract;
    job.execute().then((e) {
      Isolate.exit(port);
    });
  } catch (e, s) {
    print('JOB Execution Error');
    print(e.toString());
    print(s.toString());
    Isolate.exit(port);
  }
}
