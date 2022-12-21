import 'package:registration_demo/core/constants.dart';
import 'package:flutter/material.dart';

class AppInputDecoration extends InputDecoration {
  @override
  InputBorder get border => OutlineInputBorder(
        borderRadius: Constants.borderRadius,
        borderSide: const BorderSide(),
      );

  @override
  TextStyle get labelStyle => const TextStyle(fontWeight: FontWeight.normal);

  @override
  int get helperMaxLines => 3;

  @override
  bool get isDense => true;

  @override
  EdgeInsets get contentPadding => const EdgeInsets.all(12.5);

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

class FiberDropdownSearchDecoration extends InputDecoration {
  @override
  TextStyle get labelStyle => const TextStyle(fontWeight: FontWeight.normal);

  @override
  EdgeInsets get contentPadding => const EdgeInsets.fromLTRB(12, 12, 0, 0);

  const FiberDropdownSearchDecoration({required String labelText})
      : super(labelText: labelText);
}

// class FiberInputDecoration extends InputDecoration {
//   @override
//   InputBorder get enabledBorder => OutlineInputBorder(
//         borderRadius: Constants.borderRadius,
//         borderSide: BorderSide(color: fillColor),
//       );

//   @override
//   TextStyle get labelStyle => const TextStyle(fontWeight: FontWeight.normal);

//   @override
//   int get helperMaxLines => 3;

//   @override
//   bool get isDense => true;

//   @override
//   Color get fillColor => AppTheme.adaptiveGrey(false);

//   @override
//   bool get filled => true;

//   const FiberInputDecoration({
//     required String labelText,
//     Widget? prefixIcon,
//     Widget? suffixIcon,
//     String? helperText,
//   }) : super(
//           helperText: helperText,
//           labelText: labelText,
//           prefixIcon: prefixIcon,
//           suffixIcon: suffixIcon,
//         );
// }
