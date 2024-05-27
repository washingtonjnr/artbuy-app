// Layout
import 'package:artbuy/app/presentation/layouts/dashboard.dart';
// Flutter
import 'package:flutter/material.dart';

class RecommendedsPageWidget extends StatefulWidget {
  const RecommendedsPageWidget({super.key});

  @override
  State<RecommendedsPageWidget> createState() => RrecommendedsPageWidgetState();
}

class RrecommendedsPageWidgetState extends State<RecommendedsPageWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AuthDashboard(
      builder: (_, state) {
        return const Center(
          child: Text("Recommendeds"),
        );
      },
    );
  }
}
