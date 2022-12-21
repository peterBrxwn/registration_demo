// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_demo/core/constants.dart';
import 'package:registration_demo/feature/notification/view/view.dart';
import 'package:registration_demo/feature/register/bloc/register_bloc.dart';
import 'package:registration_demo/shared/input_decoration.dart';
import 'package:registration_demo/shared/loading_button.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

// Project imports:
// import 'package:registration_demo/core/constants.dart';
// import 'package:registration_demo/features/login/view/view.dart';
// import 'package:registration_demo/features/notifications/view/view.dart';
// import 'package:registration_demo/features/register/bloc/register_bloc.dart';
// import 'package:registration_demo/features/tab/view/view.dart';
// import 'package:registration_demo/features/user/domain/entity/user_type.dart';
// import 'package:registration_demo/shared/buttons/loading_button.dart';
// import 'package:registration_demo/shared/input_decoration.dart';
import 'package:registration_demo/shared/remove_focus.dart';
import 'package:registration_demo/utils/app_theme.dart';

class RegisterPage extends StatelessWidget implements AutoRouteWrapper {
  const RegisterPage({Key? key}) : super(key: key);

  static const routeName = 'register';
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => RegisterBloc(), child: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listenWhen: (previous, current) => current.notifMsg != null,
      listener: (context, state) {
        Notify.generic(
          context,
          state.notifMsg!.type,
          state.notifMsg!.message,
        );
      },
      child: _View(),
    );
  }
}

class _View extends StatelessWidget {
  _View({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return RemoveFocus(
      child: Scaffold(
        // backgroundColor: AppTheme.background,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Notify.info(context, 'Close button clicked');
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Notify.info(context, 'Later button clicked');
              },
              child: const Text('Later'),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                    Center(
                      child: Text(
                        'Create an account',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _Form(formKey: _formKey),
                  const SizedBox(height: 20),
                  _SubmitButton(formKey: _formKey),
                  const SizedBox(height: 20),
                  Text(
                    'Already have an account?',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: AppTheme.white),
                  ),
                  const Divider(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Continue with Google',
                      style: Theme.of(context).textTheme.bodyText1!,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Continue with Facebook',
                      style: Theme.of(context).textTheme.bodyText1!,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Continue with Apple',
                      style: Theme.of(context).textTheme.bodyText1!,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatelessWidget {
  const _Form({required this.formKey, Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              _EmailInput(),
              SizedBox(height: 10),
              _PasswordInput(),
              SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.email,
          keyboardType: TextInputType.emailAddress,
          decoration: const AppInputDecoration(
            labelText: 'Email Address',
            prefixIcon: Icon(Icons.email_outlined),
          ),
          validator: (value) {
            final val = value!.trim();
            if (val.isEmpty) return 'Please enter your email address';
            if (!Constants.emailRegExp.hasMatch(val)) {
              return 'Please enter a valid email address';
            }
            if (val.length > 99) return 'Maximum length (100) exceeded';
            return null;
          },
          onChanged: (value) {
            context.read<RegisterBloc>().add(EmailChanged(email: value));
          },
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: state.hidePassword,
          decoration: AppInputDecoration(
            labelText: 'Create a Password',
            prefixIcon: const Icon(Icons.lock_outlined),
            suffixIcon: state.password.isNotEmpty
                ? IconButton(
                    icon: Icon(
                      state.hidePassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      context
                          .read<RegisterBloc>()
                          .add(const TogglePasswordVisibility());
                    },
                  )
                : null,
          ),
          onChanged: (value) {
            context.read<RegisterBloc>().add(PasswordChanged(password: value));
          },
          validator: (value) {
            final val = value!.trim();
            if (val.isEmpty) return 'Please enter your password';
            if (val.length < 4) return 'At least 4 characters';
            return null;
          },
        );
      },
    );
  }
}

class _SubmitButton extends StatefulWidget {
  const _SubmitButton({required this.formKey, Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey;

  @override
  State<_SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<_SubmitButton> {
  final _buttonController = RoundedLoadingButtonController();
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.status == Status.registerError) {
          _buttonController.error();
          _timer = Timer(
            const Duration(seconds: 3),
            _buttonController.reset,
          );
        }
        if (state.status == Status.registerSuccess) {
          _buttonController.success();
        }
      },
      builder: (context, state) {
        return LoadingButton(
          text: 'Create an Account',
          controller: _buttonController,
          onPressed: () {
            if (widget.formKey.currentState!.validate()) {
              return context.read<RegisterBloc>().add(const Submit());
            }

            _buttonController.error();
            _timer = Timer(
              const Duration(seconds: 3),
              _buttonController.reset,
            );
          },
        );
      },
    );
  }
}
