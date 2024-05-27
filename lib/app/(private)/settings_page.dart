// Layout
import 'package:artbuy/app/presentation/layouts/dashboard.dart';
// Flutter
import 'package:flutter/material.dart';

class SettingsPageWidget extends StatefulWidget {
  const SettingsPageWidget({super.key});

  @override
  State<SettingsPageWidget> createState() => _SettingsPageWidgetState();
}

class _SettingsPageWidgetState extends State<SettingsPageWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AuthDashboard(
      builder: (_, state) {
        return const Center(
          child: Text("Settings"),
        );
      },
    );
  }
}
