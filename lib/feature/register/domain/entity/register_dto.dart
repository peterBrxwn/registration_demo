import 'package:equatable/equatable.dart';

class RegisterDto extends Equatable {
  final String? token;

  const RegisterDto({this.token});

  @override
  List<Object?> get props => [token];
}
