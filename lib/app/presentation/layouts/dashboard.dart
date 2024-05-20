// Bloc
import 'package:artbuy/app/blocs/user/user_bloc.dart';
import 'package:artbuy/app/core/constants/status.dart';
import 'package:artbuy/app/presentation/styles/colors.dart';
// Flutter
import 'package:flutter/material.dart';
// Lib
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AuthDashboard extends StatefulWidget {
  final Widget Function(BuildContext context, UserState user) builder;

  const AuthDashboard({
    super.key,
    required this.builder,
  });

  @override
  State<AuthDashboard> createState() => _AuthDashboardState();
}

class _AuthDashboardState extends State<AuthDashboard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (_) => UserBloc(),
      child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        if (state.status == StateStatus.IDLE) {
          context.read<UserBloc>().add(GetUser());
        }

        if (state.status == StateStatus.PENDING ||
            state.status == StateStatus.IDLE) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return Scaffold(
          backgroundColor: AppColors.background.lightest,
          appBar: AppBar(
            shadowColor: Colors.white,
            elevation: 1,
            title: Center(
              child: SvgPicture.asset(
                'assets/svgs/logo.svg',
                width: 35,
                color: AppColors.primary,
                alignment: Alignment.center,
              ),
            ),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: widget.builder(context, state),
            ),
          ),
        );
      }),
    );
  }
}
