import 'package:hive/hive.dart';
import 'package:queue_management/src/data/dto/job_dto.dart';
import 'package:queue_management/src/domain/enums/job_status.dart';

class JobLocal {
  Future<List<JobDto>> browse() async {
    final box = await Hive.openBox<JobDto>('jobs');
    return box.values.toList();
  }

  Future<List<JobDto>> browsePending() async {
    final box = await Hive.openBox<JobDto>('jobs');
    return box.values.where((e) => e.status == JobStatus.pending.name).toList();
  }

  Future<void> markAsCompleted(String id) async {
    final box = await Hive.openBox<JobDto>('jobs');
    final data = box.values.where((d) => d.id == id).first;
    box.put(data.key, data.copyWith(status: JobStatus.completed.name));
  }

  Future<void> add({
    required String name,
    required Map<String, dynamic> payload,
  }) async {
    await Hive.openBox<JobDto>('jobs').then((box) {
      final job = JobDto(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        status: JobStatus.pending.name,
        payload: payload,
      );
      box.put(job.id, job);
    });
  }

  Future<void> delete(String id) async {
    final box = await Hive.openBox<JobDto>('jobs');
    final data = box.values.where((d) => d.id == id).first;
    await data.delete();
  }

  Future<void> deleteByName(String name) async {
    final box = await Hive.openBox<JobDto>('jobs');
    final data = box.values.where((d) => d.name == name).first;
    await data.delete();
  }

  Future<void> clearCompleted() async {
    final box = await Hive.openBox<JobDto>('jobs');
    final completedJobs =
        box.values.where((job) => job.status == JobStatus.completed.name);
    for (final job in completedJobs) {
      await job.delete();
    }
  }

  Future<void> clearAll() async {
    final box = await Hive.openBox<JobDto>('jobs');
    await box.clear();
  }
}
