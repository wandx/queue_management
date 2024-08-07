// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JobDtoImplAdapter extends TypeAdapter<_$JobDtoImpl> {
  @override
  final int typeId = 1922;

  @override
  _$JobDtoImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$JobDtoImpl(
      id: fields[0] as String,
      name: fields[1] as String,
      status: fields[2] as String,
      payload: (fields[3] as Map).cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$JobDtoImpl obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.status)
      ..writeByte(3)
      ..write(obj.payload);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JobDtoImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JobDtoImpl _$$JobDtoImplFromJson(Map<String, dynamic> json) => _$JobDtoImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      status: json['status'] as String,
      payload: json['payload'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$JobDtoImplToJson(_$JobDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'payload': instance.payload,
    };
