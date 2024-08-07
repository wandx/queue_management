import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:queue_management/src/domain/entities/job.dart';

part 'job_dto.freezed.dart';
part 'job_dto.g.dart';

/// {@template job_dto}
/// JobDto description
/// {@endtemplate}
@freezed
class JobDto extends HiveObject with _$JobDto {
  @HiveType(typeId: 1922)
  factory JobDto({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required String status,
    @HiveField(3) required Map<String, dynamic> payload,
  }) = _JobDto;

  JobDto._();

  /// Creates a JobDto from Json map
  factory JobDto.fromJson(Map<String, dynamic> data) => _$JobDtoFromJson(data);

  Job get toEntity => Job(
        id: id,
        name: name,
        status: status,
        payload: payload,
      );
}
