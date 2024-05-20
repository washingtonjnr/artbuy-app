import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const MaterialColor primary = MaterialColor(
    0xFF75206D,
    <int, Color>{
      50: Color(0xFFF5CBF2),
      100: Color(0xFFF5CBF2),
      200: Color(0xFFF5CBF2),
      300: Color(0xFFA24E9B),
      400: Color(0xFFA24E9B),
      500: Color(0xFF8E2785),
      600: Color(0xFF8E2785),
      700: Color(0xFF75206D),
      800: Color(0xFF5B1955),
      900: Color(0xFF5B1955),
    },
  );

  static const MaterialColor secondary = MaterialColor(
    0xFF75206D,
    <int, Color>{
      50: Color(0xFFF5CBF2),
      100: Color(0xFFF5CBF2),
      200: Color(0xFFF5CBF2),
      300: Color(0xFFA24E9B),
      400: Color(0xFFA24E9B),
      500: Color(0xFF8E2785),
      600: Color(0xFF8E2785),
      700: Color(0xFF75206D),
      800: Color(0xFF5B1955),
      900: Color(0xFF5B1955),
    },
  );

  static _TextColors text = _TextColors();
  static _StatusColors status = _StatusColors();
  static _BackgroundColors background = _BackgroundColors();
}

class _TextColors {
  final Color lightest = const Color(0xFFFFFFFF);
  final Color light = const Color(0xFFF7F7F7);
  final Color medium = const Color(0xFFA3A3A3);
  final Color dark = const Color(0xFF4A4A4A);
  final Color darkest = const Color(0xFF141414);

  const _TextColors();
}

@immutable
class _BackgroundColors {
  final Color lightest = const Color(0xFFFFFFFF);
  final Color light = const Color(0xFFF7F7F7);
  final Color medium = const Color(0xFFA3A3A3);
  final Color dark = const Color(0xFF525252);
  final Color darkest = const Color(0xFF141414);

  const _BackgroundColors();
}

@immutable
final class _StatusColors {
  final Color error = const Color(0xFFCF4544);
  final Color warning = const Color(0xFF269860);
  final Color success = const Color(0xFFF7B205);

  const _StatusColors();
}
