// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:fluttertoast/fluttertoast.dart';

// Project imports:
import 'package:registration_demo/feature/notification/services/models/notif_msg.dart';
import 'package:registration_demo/utils/app_theme.dart';

class Notify {
  static void error(BuildContext context, [String? msg]) {
    msg = msg?.trim() ?? '';
    if (msg.isEmpty || msg.length > 150) {
      msg = 'Something went wrong. Please try again.';
    }

    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 8,
      backgroundColor: Theme.of(context).errorColor,
      textColor: AppTheme.white,
    );
  }

  static void generic(BuildContext context, NotificationType type, String msg) {
        _removeToast(context);
    switch (type) {
      case NotificationType.error:
        Notify.error(context, msg);
        break;
      case NotificationType.info:
        Notify.info(msg);
        break;
      case NotificationType.success:
        Notify.success(context, msg);
        break;
    }
  }

  static void info(String msg) {
    msg = msg.trim();
    if (msg.isEmpty || msg.length > 150) {
      msg = 'Something went wrong. Please try again.';
    }

    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 8,
      backgroundColor: AppTheme.darkGrey,
      textColor: AppTheme.lightGrey,
    );
  }

  static void _removeToast(BuildContext context) {
    Fluttertoast.cancel();
    final fToast = FToast();
    fToast.init(context);
  }

  static void success(BuildContext context, String msg) {
    msg = msg.trim();
    if (msg.isEmpty || msg.length > 150) msg = 'Successful.';

    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 8,
      backgroundColor: Theme.of(context).primaryColor,
      textColor: AppTheme.white,
    );
  }
}
