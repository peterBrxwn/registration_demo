import 'package:registration_demo/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:registration_demo/utils/app_theme.dart';

class AppInputDecoration extends InputDecoration {
  @override
  InputBorder get enabledBorder => OutlineInputBorder(
        borderRadius: Constants.borderRadius,
        borderSide: BorderSide(color: fillColor),
      );

  @override
  TextStyle get labelStyle => const TextStyle(
        color: AppTheme.darkGrey,
        fontWeight: FontWeight.normal,
      );

  @override
  int get helperMaxLines => 3;

  @override
  bool get isDense => true;

  @override
  Color get fillColor => AppTheme.white;

  @override
  bool get filled => true;

  const AppInputDecoration({
    required String labelText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? helperText,
  }) : super(
          helperText: helperText,
          labelText: labelText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        );
}
