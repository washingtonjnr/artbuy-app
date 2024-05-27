// Routes
import "dart:async";

import "package:artbuy/app/core/utils/session.dart";
import "package:artbuy/routes.dart";
// Flutter
import "package:flutter/material.dart";
// Lib
import "package:routefly/routefly.dart";

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "ARTBUY",
      routerConfig: Routefly.routerConfig(
        routes: routes, // GENERATED
        initialPath: routePaths.splash,
        middlewares: [_guardRoute],
      ),
    );
  }
}

// FutureOr<RouteInformation> _showSplashScreen(
//     RouteInformation routeInformation) {
//   return routeInformation.redirect(Uri.parse("/splash"));
// }

FutureOr<RouteInformation> _guardRoute(
    RouteInformation routeInformation) async {
  try {
    final accessToken = await AppLocalStorage.getAccessToken();
    //
    final Uri uri = routeInformation.uri;
    final List publicUris = ["/signin", "/signup", "forgot_password"];

    print("\n\n\nuri");
    print(uri.path);
    print(publicUris);
    print(publicUris.contains(uri.path));

    if (accessToken == null && !publicUris.contains(uri.path)) {
      return routeInformation.rewrite(Uri.parse("/signin"));
    }

    return routeInformation;
  } on Exception {
    return routeInformation.rewrite(Uri.parse("/signin"));
  }
}
