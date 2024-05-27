// Layout
import "package:artbuy/app/(public)/signin/bloc/signin_bloc.dart";
import "package:artbuy/app/core/constants/status.dart";
import "package:artbuy/app/presentation/layouts/auth.dart";
import "package:artbuy/app/presentation/styles/colors.dart";
import "package:artbuy/app/presentation/widgets/button.dart";
import "package:artbuy/app/presentation/widgets/inputs/input.dart";
import "package:artbuy/routes.dart";
// Flutter
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:routefly/routefly.dart";

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
        child: Column(
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
            Form(
              child: BlocBuilder<SigninBloc, SigninState>(
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InputWidget(
                        icon: Icons.email_rounded,
                        hintText: "E-mail",
                        initialValue: state.email,
                        textError: state.textEmailError,
                        onChanged: (email) =>
                            context.read<SigninBloc>().add(EmailChange(email)),
                      ),
                      const SizedBox(height: 16.0),
                      InputWidget(
                        icon: Icons.lock,
                        hintText: "Password",
                        initialValue: state.password,
                        textError: state.textPasswordError,
                        obscureText: true,
                        onChanged: (password) => context
                            .read<SigninBloc>()
                            .add(PasswordChange(password)),
                      ),
                      const SizedBox(height: 6.0),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Forgot your password?",
                            style: TextStyle(
                              fontSize: 10.0,
                              color: AppColors.text.dark,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32.0),
                      ButtonWidget(
                        text: "Signin",
                        isLoading: state.status == StateStatus.PENDING,
                        onPressed: () {
                          context
                              .read<SigninBloc>()
                              .add(FormSubmit((event, emit) {}));
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Don't have account?",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: AppColors.text.dark,
                  ),
                ),
                GestureDetector(
                  child: const Text(
                    " Create now",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  onTap: () {
                    Routefly.navigate(routePaths.signup);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
