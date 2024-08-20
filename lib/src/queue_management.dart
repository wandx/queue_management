import 'dart:isolate';

import 'package:queue_management/src/data/sources/local/job_local.dart';
import 'package:queue_management/src/domain/contracts/job_execution_contract.dart';
import 'package:queue_management/src/domain/entities/job.dart';

/// {@template queue_management}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class QueueManagement {
  /// {@macro queue_management}
  QueueManagement._();

  static final instance = QueueManagement._();

  List<JobExecutionContract> jobs = [];

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

    if (allPendingJobs.isEmpty) return;

    for (final pendingJob in allPendingJobs) {
      for (final job in jobs) {
        if (job.name == pendingJob.name) {
          try {
            final receivePort = ReceivePort();
            job.payload = pendingJob.payload;
            await Isolate.spawn(
              _executeJob,
              [receivePort.sendPort, job, pendingJob.id],
              onError: receivePort.sendPort,
              onExit: receivePort.sendPort,
            );
          } catch (e) {}
        }
      }
    }
  }
}

Future<void> _executeJob(List<dynamic> args) async {
  final port = args[0] as SendPort;
  try {
    final local = JobLocal();

    final job = args[1] as JobExecutionContract;
    final jobId = args[2] as String;
    await job.execute();
    await local.markAsCompleted(jobId);
    Isolate.exit(port);
  } catch (e) {
    Isolate.exit(port);
  }
}
