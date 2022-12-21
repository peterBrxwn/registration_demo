// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:rounded_loading_button/rounded_loading_button.dart';

// Project imports:
import 'package:registration_demo/core/constants.dart';
import 'package:registration_demo/utils/app_theme.dart';

class LoadingButton extends StatelessWidget {
  final RoundedLoadingButtonController controller;
  final Function()? onPressed;
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
      borderRadius: Constants.borderRadiusInt,
      controller: controller,
      color: AppTheme.themePrimary,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
