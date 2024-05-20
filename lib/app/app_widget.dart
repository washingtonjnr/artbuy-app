// Routes
import 'package:artbuy/routes.dart';
// Flutter
import 'package:flutter/material.dart';
// Lib
import 'package:routefly/routefly.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ARTBUY',
      routerConfig: Routefly.routerConfig(
        routes: routes, // GENERATED
        initialPath: routePaths.auth.splash,
      ),
    );
  }
}
