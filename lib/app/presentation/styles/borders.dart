import 'package:artbuy/app/presentation/styles/colors.dart';
import 'package:flutter/material.dart';

class AppBorders {
  AppBorders._();

  static final Border borderBottom = Border(
    bottom: BorderSide(
      width: 1,
      color: AppColors.background.medium,
    ),
  );

  static final Border borderVertical = Border.symmetric(
    horizontal: BorderSide(
      width: 1,
      color: AppColors.background.medium,
    ),
  );

// Error
  static final Border borderBottomError = Border(
    bottom: BorderSide(
      width: 1,
      color: AppColors.status.error,
    ),
  );

  static InputBorder buildBorder({
    String type = 'underline',
    Color? color,
    double? radius,
  }) {
    return type == 'underline'
        ? UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: color ?? AppColors.background.medium,
            ),
          )
        : OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 4.0),
            borderSide: BorderSide(
              width: 1,
              color: color ?? AppColors.background.medium,
            ),
          );
  }
}
