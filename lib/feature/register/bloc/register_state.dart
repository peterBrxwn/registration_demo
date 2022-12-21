part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.email = '',
    this.hidePassword = true,
    this.notifMsg,
    this.password = '',
    this.status = Status.initial,
  });
  final String email;
  final bool hidePassword;
  final NotifMsg? notifMsg;
  final String password;
  final Status status;

  RegisterState copyWith({
    String? email,
    bool? hidePassword,
    NotifMsg? notifMsg,
    String? password,
    Status? status,
  }) {
    return RegisterState(
      email: email ?? this.email,
      hidePassword: hidePassword ?? this.hidePassword,
      notifMsg: notifMsg,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        email,
        hidePassword,
        notifMsg,
        password,
        status,
      ];
}

enum Status {
  initial,
  loading,
  registerError,
  registerSuccess,
}
