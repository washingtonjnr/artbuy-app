// Core
import 'package:artbuy/app/presentation/styles/colors.dart';
//
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextStyles {
  TextStyles._();

  static TextStyle? getStyle({required String key}) {
    switch (key) {
      // TO ALL
      case "title":
        return titleStyle;
      case "subtitle":
        return subtitleStyle;
      case "text":
        return textStyle;
      case "text-bold":
        return textBoldStyle;

      // TO COMPONENTS
      case 'palceholder':
        return placeholderStyle;

      default:
        return null;
    }
  }

  static final TextStyle titleStyle = TextStyle(
    color: AppColors.text.dark,
    fontSize: 20,
  );

  static final TextStyle subtitleStyle = TextStyle(
    fontSize: 16,
    color: AppColors.text.dark,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle textStyle = TextStyle(
    color: AppColors.text.dark,
    fontSize: 12,
  );

  static final TextStyle textBoldStyle = TextStyle(
    color: AppColors.text.dark,
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );

  // TO COMPONENTS
  static final TextStyle placeholderStyle = TextStyle(
    fontSize: 16.0,
    color: AppColors.background.medium,
  );
}
