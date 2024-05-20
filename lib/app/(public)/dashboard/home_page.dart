import 'package:artbuy/app/presentation/layouts/dashboard.dart';
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
      builder: (context, state) {
        String name = state.user?.name ?? "-";

        return Center(
          child: Text("Hello, $name!"),
        );
      },
    );
  }
}
