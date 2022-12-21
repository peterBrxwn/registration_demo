// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$RegisterParamToJson(RegisterParam instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('stringify', instance.stringify);
  val['hash_code'] = instance.hashCode;
  val['email'] = instance.email;
  val['password'] = instance.password;
  val['props'] = instance.props;
  return val;
}
