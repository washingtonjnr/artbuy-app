// Utils
import 'package:artbuy/app/core/utils/session.dart';
// Styles
import 'package:artbuy/app/presentation/styles/colors.dart';
// Routes
import 'package:artbuy/routes.dart';
// Flutter
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// Lib
import 'package:routefly/routefly.dart';

class SplashPageWidget extends StatefulWidget {
  const SplashPageWidget({super.key});

  @override
  State<SplashPageWidget> createState() => _SplashPageWidgetState();
}

class _SplashPageWidgetState extends State<SplashPageWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Animation
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();

    Future.delayed(const Duration(seconds: 4), () async {
      // Check state and navigate
      await loadFromFuture();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _animation,
        child: Container(
          alignment: Alignment.center,
          color: AppColors.primary,
          child: SvgPicture.asset(
            'assets/svgs/logo.svg',
            width: 100,
            height: 100,
            color: Colors.white,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }

  Future loadFromFuture() async {
    try {
      final accessToken = await AppLocalStorage.getAccessToken();

      if (accessToken == null) {
        return Routefly.navigate(routePaths.auth.signin);
      }

      return Routefly.navigate(routePaths.dashboard.home);
    } on Exception {
      return Routefly.navigate(routePaths.auth.signin);
    }
  }
}
