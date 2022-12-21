part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends RegisterEvent {
  const EmailChanged({required this.email});
  final String email;

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends RegisterEvent {
  const PasswordChanged({required this.password});
  final String password;

  @override
  List<Object> get props => [password];
}

class Submit extends RegisterEvent {
  const Submit();

  @override
  List<Object> get props => [];
}

class TogglePasswordVisibility extends RegisterEvent {
  const TogglePasswordVisibility();

  @override
  List<Object> get props => [];
}
