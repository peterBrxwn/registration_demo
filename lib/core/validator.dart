import 'package:registration_demo/core/constants.dart';

class Validator {
  static String? email(String? value) {
    if (value == null) return 'Please enter your email address';

    final val = value.trim();
    if (val.isEmpty) return 'Please enter your email address';
    if (!Constants.emailRegExp.hasMatch(val)) {
      return 'Please enter a valid email address';
    }
    if (val.length > 99) return 'Maximum length (100) exceeded';
    return null;
  }

  static String? password(String? value) {
    if (value == null) return 'Please enter your password';

    final val = value.trim();
    if (val.isEmpty) return 'Please enter your password';
    if (val.length < 8) return 'Password must contain at least 8 characters.';
    if (!Constants.passwordRegExp.hasMatch(val)) {
      return 'Password must contain a letter and a number.';
    }
    return null;
  }
}
