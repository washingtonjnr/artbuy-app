import 'package:artbuy/app/presentation/styles/colors.dart';
import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final bool obscureText;
  final Function(String) onChanged;

  const InputWidget({
    super.key,
    //
    required this.icon,
    required this.hintText,
    required this.onChanged,
    //
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        hintText: hintText,
        prefixIcon: Icon(icon, color: AppColors.primary),
        hintStyle: const TextStyle(color: AppColors.primary),
        fillColor: AppColors.primary.withOpacity(0.1),
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
