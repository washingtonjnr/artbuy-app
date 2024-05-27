// Utils
// Styles
import 'package:artbuy/app/presentation/styles/colors.dart';
// Flutter
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.primary.withOpacity(.5),
                AppColors.primary.withOpacity(.8),
                const Color(0xFF5B1955),
              ],
              tileMode: TileMode.clamp,
            ),
          ),
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
}
