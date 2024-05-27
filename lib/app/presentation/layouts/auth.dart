import 'package:artbuy/app/presentation/styles/colors.dart';
import 'package:artbuy/app/presentation/widgets/wave_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuthLayout extends StatelessWidget {
  final Widget children;
  //
  final double heighHeader;

  const AuthLayout({
    super.key,
    required this.children,
    this.heighHeader = 160,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background.light,
      body: SafeArea(
        child: Flex(
          direction: Axis.vertical,
          children: [
            SizedBox(
              height: heighHeader,
              child: HeaderHaveWidget(
                heighHeader,
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: SvgPicture.asset(
                    'assets/svgs/logo.svg',
                    width: 40,
                    color: Colors.white,
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: children,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
