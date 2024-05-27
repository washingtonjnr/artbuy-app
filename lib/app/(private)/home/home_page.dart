// Layout
import 'package:artbuy/app/presentation/layouts/dashboard.dart';
// Flutter
import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AuthDashboard(
      builder: (_, state) {
        String name = state.user?.name ?? '-';

        return Center(
          child: Text('Home! Hello, $name!'),
        );
      },
    );
  }
}
