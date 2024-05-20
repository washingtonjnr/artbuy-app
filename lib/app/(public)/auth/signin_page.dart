// Layout
import 'package:artbuy/app/blocs/signin/signin_bloc.dart';
import 'package:artbuy/app/core/constants/status.dart';
import 'package:artbuy/app/presentation/layouts/auth.dart';
import 'package:artbuy/app/presentation/styles/colors.dart';
import 'package:artbuy/app/presentation/widgets/button.dart';
import 'package:artbuy/app/presentation/widgets/inputs/input.dart';
// Flutter
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninPageWidget extends StatefulWidget {
  const SigninPageWidget({
    super.key,
  });

  @override
  State<SigninPageWidget> createState() => _SigninPageWidgetState();
}

class _SigninPageWidgetState extends State<SigninPageWidget> {
  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      children: BlocProvider<SigninBloc>(
        create: (_) => SigninBloc(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<SigninBloc, SigninState>(
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "ARTBUY",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      Text(
                        "Log in to your account",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: AppColors.text.dark,
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      InputWidget(
                        hintText: 'E-mail',
                        icon: Icons.person,
                        onChanged: (email) =>
                            context.read<SigninBloc>().add(EmailChange(email)),
                      ),
                      const SizedBox(height: 16.0),
                      InputWidget(
                        hintText: 'Password',
                        icon: Icons.lock,
                        obscureText: true,
                        onChanged: (password) => context
                            .read<SigninBloc>()
                            .add(PasswordChange(password)),
                      ),
                      const SizedBox(height: 6.0),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            print("FORGOT PASSWORD");
                          },
                          child: Text(
                            "Forgot your password?",
                            style: TextStyle(
                              fontSize: 10.0,
                              color: AppColors.text.dark,
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
              const SizedBox(height: 32.0),
              BlocBuilder<SigninBloc, SigninState>(
                builder: (context, state) {
                  return ButtonWidget(
                    text: 'Login',
                    isLoading: state.status == StateStatus.PENDING,
                    isDisabled: state.email.isEmpty || state.password.isEmpty,
                    onPressed: () {
                      context.read<SigninBloc>().add(
                            FormSubmit((event, emit) {}),
                          );
                    },
                  );
                },
              ),
              const SizedBox(height: 10.0),
              RichText(
                text: TextSpan(
                  text: "Don't have account?",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: AppColors.text.dark,
                  ),
                  children: const [
                    TextSpan(
                      text: " Create now",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
