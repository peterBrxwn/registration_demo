part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.email = '',
    this.hidePassword = true,
    this.notifMsg,
    this.password = '',
    this.submitEnabled = false,
    this.status = Status.initial,
    this.token = '',
  });
  final String email;
  final bool hidePassword;
  final NotifMsg? notifMsg;
  final String password;
  final bool submitEnabled;
  final Status status;
  final String token;

  RegisterState copyWith({
    String? email,
    bool? hidePassword,
    NotifMsg? notifMsg,
    String? password,
    bool? submitEnabled,
    Status? status,
    String? token,
  }) {
    return RegisterState(
      email: email ?? this.email,
      hidePassword: hidePassword ?? this.hidePassword,
      notifMsg: notifMsg,
      password: password ?? this.password,
      submitEnabled: submitEnabled ?? this.submitEnabled,
      status: status ?? this.status,
      token: token ?? this.token,
    );
  }

  @override
  List<Object?> get props => [
        email,
        hidePassword,
        notifMsg,
        password,
        submitEnabled,
        status,
        token,
      ];
}

enum Status {
  initial,
  loading,
  registerError,
  registerSuccess,
}
