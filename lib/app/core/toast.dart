import 'package:artbuy/app/presentation/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastType { error, success, warning }

class AppToast {
  static Future show(
    String message, {
    Toast length = Toast.LENGTH_SHORT,
    ToastType type = ToastType.success,
  }) async {
    Color bgColor;
    Color textColor = Colors.white;
    // IconData icon;

    switch (type) {
      case ToastType.error:
        bgColor = AppColors.status.error;
        // icon = Icons.cancel_outlined;

        break;

      case ToastType.success:
        bgColor = AppColors.status.success;
        // icon = Icons.check_circle_outline;

        break;

      case ToastType.warning:
        bgColor = AppColors.status.warning;
        // icon = Icons.info_outline;

        break;
    }

    return Fluttertoast.showToast(
      msg: message,
      toastLength: length,
      gravity: ToastGravity.TOP,
      backgroundColor: bgColor,
      textColor: textColor,
      fontSize: 16.0,
      timeInSecForIosWeb: 1,
      webPosition: "center",
      // webBgColor: "linear-gradient(to right, #ff5f6d, #ffc371)",
    );
  }
}
