// Package imports:
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

// Project imports:
part 'register_param.g.dart';

@JsonSerializable(
  createFactory: false,
  explicitToJson: true,
  fieldRename: FieldRename.snake,
  includeIfNull: false,
)
class RegisterParam extends Equatable {
  final String email;
  final String password;

  const RegisterParam({
    required this.email,
    required this.password,
  });

  RegisterParam copyWith({String? email, String? password}) {
    return RegisterParam(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toJson() => _$RegisterParamToJson(this);

  @override
  List<Object?> get props => [email, password];
}
