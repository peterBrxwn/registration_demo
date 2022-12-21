// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:registration_demo/core/validator.dart';
import 'package:registration_demo/feature/dashboard/view/view.dart';
import 'package:registration_demo/feature/notification/view/view.dart';
import 'package:registration_demo/feature/register/bloc/register_bloc.dart';
import 'package:registration_demo/feature/register/services/repo.dart';
import 'package:registration_demo/shared/input_decoration.dart';
import 'package:registration_demo/shared/loading_button.dart';
import 'package:registration_demo/shared/social_button.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

// Project imports:
import 'package:registration_demo/shared/remove_focus.dart';
import 'package:registration_demo/utils/app_theme.dart';

class RegisterPage extends StatelessWidget implements AutoRouteWrapper {
  const RegisterPage({Key? key}) : super(key: key);

  static const routeName = 'register';
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterBloc(
        registerRepo: context.read<RegisterImpl>(),
      ),
      child: this,
    );
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
        backgroundColor: AppTheme.lightGrey,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close, color: AppTheme.darkGrey),
            onPressed: () {
              Notify.info('Close button clicked');
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Notify.info('Later button clicked');
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  'Later',
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: AppTheme.darkGrey,
                      ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Create an account',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: AppTheme.black),
                    ),
                  ),
                  const SizedBox(height: 50),
                  _Form(formKey: _formKey),
                  const SizedBox(height: 30),
                  _SubmitButton(formKey: _formKey),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Notify.info('You already have an account.');
                    },
                    child: Text(
                      'Already have an account?',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: AppTheme.darkGrey),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Divider(color: AppTheme.darkGrey),
                  const SizedBox(height: 30),
                  const SocialButton(
                    icon: Icon(
                      FontAwesomeIcons.google,
                      color: AppTheme.black,
                    ),
                    name: 'Google',
                  ),
                  const SizedBox(height: 20),
                  const SocialButton(
                    icon: Icon(
                      FontAwesomeIcons.facebook,
                      color: AppTheme.black,
                    ),
                    name: 'Facebook',
                  ),
                  const SizedBox(height: 20),
                  const SocialButton(
                    icon: Icon(
                      FontAwesomeIcons.apple,
                      color: AppTheme.black,
                    ),
                    name: 'Apple',
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
          ),
          validator: Validator.email,
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
          initialValue: state.password,
          obscureText: state.hidePassword,
          decoration: AppInputDecoration(
            labelText: 'Password',
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
          validator: Validator.password,
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
          Notify.info('Token: ${state.token}.');
          _timer = Timer(
            const Duration(seconds: 2),
            () => context.router.replaceNamed(DashboardPage.routeName),
          );
        }
      },
      builder: (context, state) {
        return LoadingButton(
          text: 'Create an Account',
          controller: _buttonController,
          onPressed: state.submitEnabled
              ? () {
                  if (!widget.formKey.currentState!.validate()) return;
                  return context.read<RegisterBloc>().add(const Submit());
                }
              : null,
        );
      },
    );
  }
}
