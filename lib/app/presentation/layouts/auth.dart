import 'package:artbuy/app/presentation/styles/colors.dart';
import 'package:artbuy/app/presentation/widgets/wave_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuthLayout extends StatelessWidget {
  final Widget children;
  //
  final double _heighHeader = 160;

  const AuthLayout({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background.light,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: _heighHeader,
                child: HeaderHaveWidget(
                  _heighHeader,
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: SvgPicture.asset(
                      'assets/svgs/logo.svg',
                      width: 65,
                      color: Colors.white,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: children,
              )
            ],
          ),
        ],
      ),
    );
  }
}
