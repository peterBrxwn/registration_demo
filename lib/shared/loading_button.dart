// Flutter imports:
import 'package:flutter/material.dart';
import 'package:registration_demo/utils/app_theme.dart';

// Package imports:
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoadingButton extends StatelessWidget {
  final RoundedLoadingButtonController controller;
  final Function() onPressed;
  final String text;

  const LoadingButton({
    required this.controller,
    required this.onPressed,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedLoadingButton(
      borderRadius: 5,
      controller: controller,
      color: AppTheme.themePrimary,
      onPressed: onPressed,
      width: 65,
      height: 37,
      child: Text(
        text.toUpperCase(),
        // style: const TextStyle(color: AppTheme.white),
      ),
    );
  }
}
