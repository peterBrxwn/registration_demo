// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterDtoImpl _$RegisterDtoImplFromJson(Map<String, dynamic> json) =>
    RegisterDtoImpl(
      token: json['token'] as String?,
    );

Map<String, dynamic> _$RegisterDtoImplToJson(RegisterDtoImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', instance.token);
  return val;
}
