// Layout
import 'package:artbuy/app/presentation/layouts/auth.dart';
// Flutter
import 'package:flutter/material.dart';

class ForgotPasswordPageWidget extends StatefulWidget {
  const ForgotPasswordPageWidget({
    super.key,
  });

  @override
  State<ForgotPasswordPageWidget> createState() =>
      _ForgotPasswordPageWidgetState();
}

class _ForgotPasswordPageWidgetState extends State<ForgotPasswordPageWidget> {
  @override
  Widget build(BuildContext context) {
    return const AuthLayout(
      children: Center(
        child: Text('Forgot password'),
      ),
    );
  }
}
