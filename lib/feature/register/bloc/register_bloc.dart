import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_demo/feature/notification/services/models/notif_msg.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<EmailChanged>(_emailChanged);
    on<PasswordChanged>(_passwordChanged);
    on<Submit>(_submit);
    on<TogglePasswordVisibility>(_togglePasswordVisibility);
  }

  void _emailChanged(EmailChanged event, Emitter<RegisterState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordChanged(PasswordChanged event, Emitter<RegisterState> emit) {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _submit(Submit event, Emitter<RegisterState> emit) async {
    try {
    } catch (e) {
      return emit(
        state.copyWith(
          notifMsg: const NotifMsg(),
          status: Status.registerError,
        ),
      );
    }
  }

  void _togglePasswordVisibility(
    TogglePasswordVisibility event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(hidePassword: !state.hidePassword));
  }
}
