// Styles
import 'package:artbuy/app/presentation/styles/colors.dart';
// Flutter
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  //
  final VoidCallback onPressed;
  //
  final Color color;
  final Color textColor;
  //
  final double fontSize;
  final double padding;
  final double borderRadius;
  //
  final bool isLoading;
  final bool isDisabled;

  const ButtonWidget({
    super.key,
    //
    required this.text,
    //
    required this.onPressed,
    //
    this.isLoading = false,
    this.isDisabled = false,
    //
    this.color = AppColors.primary,
    this.textColor = Colors.white,
    //
    this.padding = 12.0,
    this.fontSize = 16.0,
    this.borderRadius = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: (isLoading || isDisabled) ? null : onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 5,
          backgroundColor: isDisabled ? Colors.grey : color,
          padding: EdgeInsets.symmetric(horizontal: padding, vertical: 4.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: isLoading
            ? SizedBox(
                width: 20.0,
                height: 20.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(textColor),
                  strokeWidth: 2.0,
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  fontSize: fontSize,
                  color: textColor,
                ),
              ),
      ),
    );
  }
}
