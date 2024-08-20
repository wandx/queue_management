import 'dart:isolate';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:queue_management/queue_management.dart';
import 'package:queue_management/src/data/sources/local/job_local.dart';

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
            await local.markAsCompleted(pendingJob.id);
          } catch (e) {
            print(e.toString());
          }
        }
      }
    }
  }
}

Future<void> _executeJob(List<dynamic> args) async {
  final port = args[0] as SendPort;
  try {
    final job = args[1] as JobExecutionContract;
    await job.execute();
    Isolate.exit(port);
  } catch (e, s) {
    print('JOB Execution Error');
    print(e.toString());
    print(s.toString());
    Isolate.exit(port);
  }
}
