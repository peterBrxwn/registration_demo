// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:registration_demo/feature/register/domain/entity/register_dto.dart';

part 'register_dto.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
  includeIfNull: false,
)
class RegisterDtoImpl extends RegisterDto {
  const RegisterDtoImpl({String? token}) : super(token: token);

  factory RegisterDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$RegisterDtoImplFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterDtoImplToJson(this);

  factory RegisterDtoImpl.fromEntity(RegisterDto registerData) {
    return RegisterDtoImpl(token: registerData.token);
  }
}
