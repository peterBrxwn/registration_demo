import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_demo/core/validator.dart';
import 'package:registration_demo/feature/notification/services/models/notif_msg.dart';
import 'package:registration_demo/feature/register/domain/repo.dart';
import 'package:registration_demo/feature/register/services/params/register_param.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({required RegisterRepo registerRepo})
      : _registerRepo = registerRepo,
        super(const RegisterState()) {
    on<EmailChanged>(_emailChanged);
    on<PasswordChanged>(_passwordChanged);
    on<Submit>(_submit);
    on<TogglePasswordVisibility>(_togglePasswordVisibility);
  }
  final RegisterRepo _registerRepo;

  void _emailChanged(EmailChanged event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(
        email: event.email,
        submitEnabled: enableSubmit(event.email, state.password),
      ),
    );
  }

  void _passwordChanged(PasswordChanged event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(
        password: event.password,
        submitEnabled: enableSubmit(state.email, event.password),
      ),
    );
  }

  Future<void> _submit(Submit event, Emitter<RegisterState> emit) async {
    try {
      final data = await _registerRepo.register(
        param: RegisterParam(email: state.email, password: state.password),
      );
      data.fold(
        (l) => emit(
          state.copyWith(
            notifMsg: const NotifMsg(message: 'Something went wrong'),
            status: Status.registerError,
          ),
        ),
        (r) => emit(
          state.copyWith(token: r.token, status: Status.registerSuccess),
        ),
      );
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

  enableSubmit(String email, String password) {
    return Validator.email(email) == null &&
        Validator.password(password) == null;
  }
}
