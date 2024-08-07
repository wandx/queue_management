// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JobDto _$JobDtoFromJson(Map<String, dynamic> json) {
  return _JobDto.fromJson(json);
}

/// @nodoc
mixin _$JobDto {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String get status => throw _privateConstructorUsedError;
  @HiveField(3)
  Map<String, dynamic> get payload => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JobDtoCopyWith<JobDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobDtoCopyWith<$Res> {
  factory $JobDtoCopyWith(JobDto value, $Res Function(JobDto) then) =
      _$JobDtoCopyWithImpl<$Res, JobDto>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String status,
      @HiveField(3) Map<String, dynamic> payload});
}

/// @nodoc
class _$JobDtoCopyWithImpl<$Res, $Val extends JobDto>
    implements $JobDtoCopyWith<$Res> {
  _$JobDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? status = null,
    Object? payload = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      payload: null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JobDtoImplCopyWith<$Res> implements $JobDtoCopyWith<$Res> {
  factory _$$JobDtoImplCopyWith(
          _$JobDtoImpl value, $Res Function(_$JobDtoImpl) then) =
      __$$JobDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String status,
      @HiveField(3) Map<String, dynamic> payload});
}

/// @nodoc
class __$$JobDtoImplCopyWithImpl<$Res>
    extends _$JobDtoCopyWithImpl<$Res, _$JobDtoImpl>
    implements _$$JobDtoImplCopyWith<$Res> {
  __$$JobDtoImplCopyWithImpl(
      _$JobDtoImpl _value, $Res Function(_$JobDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? status = null,
    Object? payload = null,
  }) {
    return _then(_$JobDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      payload: null == payload
          ? _value._payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1922)
class _$JobDtoImpl extends _JobDto {
  _$JobDtoImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.status,
      @HiveField(3) required final Map<String, dynamic> payload})
      : _payload = payload,
        super._();

  factory _$JobDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobDtoImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String status;
  final Map<String, dynamic> _payload;
  @override
  @HiveField(3)
  Map<String, dynamic> get payload {
    if (_payload is EqualUnmodifiableMapView) return _payload;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_payload);
  }

  @override
  String toString() {
    return 'JobDto(id: $id, name: $name, status: $status, payload: $payload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._payload, _payload));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, status,
      const DeepCollectionEquality().hash(_payload));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JobDtoImplCopyWith<_$JobDtoImpl> get copyWith =>
      __$$JobDtoImplCopyWithImpl<_$JobDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JobDtoImplToJson(
      this,
    );
  }
}

abstract class _JobDto extends JobDto {
  factory _JobDto(
          {@HiveField(0) required final String id,
          @HiveField(1) required final String name,
          @HiveField(2) required final String status,
          @HiveField(3) required final Map<String, dynamic> payload}) =
      _$JobDtoImpl;
  _JobDto._() : super._();

  factory _JobDto.fromJson(Map<String, dynamic> json) = _$JobDtoImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String get status;
  @override
  @HiveField(3)
  Map<String, dynamic> get payload;
  @override
  @JsonKey(ignore: true)
  _$$JobDtoImplCopyWith<_$JobDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
