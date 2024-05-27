import 'package:artbuy/app/presentation/styles/colors.dart';
import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final IconData? icon;
  final String hintText;
  final String? textError;
  final String? initialValue;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Function(String) onChanged;

  const InputWidget({
    super.key,
    //
    required this.icon,
    required this.hintText,
    required this.onChanged,
    //
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    //
    this.textError,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    final Color stateColor =
        textError == null ? AppColors.primary : AppColors.status.error;

    return TextFormField(
      onChanged: onChanged,
      obscureText: obscureText,
      initialValue: initialValue,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        hintText: hintText,
        errorText: textError,
        prefixIcon: Icon(icon, color: stateColor),
        hintStyle: TextStyle(color: stateColor),
        fillColor: (stateColor).withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
          borderSide: BorderSide.none,
        ),
      ),
      textAlignVertical: TextAlignVertical.center,
      style: TextStyle(
        color: AppColors.text.dark,
      ),
    );
  }
}
