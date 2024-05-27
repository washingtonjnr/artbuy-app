// Layout
import 'package:artbuy/app/(public)/signup/bloc/signup_bloc.dart';
import 'package:artbuy/app/core/constants/status.dart';
import 'package:artbuy/app/presentation/layouts/auth.dart';
import 'package:artbuy/app/presentation/styles/colors.dart';
import 'package:artbuy/app/presentation/widgets/button.dart';
import 'package:artbuy/app/presentation/widgets/inputs/input.dart';
import 'package:artbuy/routes.dart';
// Flutter
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routefly/routefly.dart';

class SignupPageWidget extends StatefulWidget {
  const SignupPageWidget({
    super.key,
  });

  @override
  State<SignupPageWidget> createState() => _SignupPageWidgetState();
}

class _SignupPageWidgetState extends State<SignupPageWidget> {
  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      heighHeader: 120,
      children: BlocProvider<SignupBloc>(
        create: (_) => SignupBloc(),
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
              "Create your account",
              style: TextStyle(
                fontSize: 12.0,
                color: AppColors.text.dark,
              ),
            ),
            Form(
              child: BlocBuilder<SignupBloc, SignupState>(builder: (_, state) {
                return Column(
                  children: [
                    InputWidget(
                      icon: Icons.person,
                      initialValue: state.name,
                      textError: state.textNameError,
                      hintText: "Enter your name and surname",
                      onChanged: (name) {
                        context.read<SignupBloc>().add(NameChange(name));
                      },
                    ),
                    const SizedBox(height: 16.0),
                    InputWidget(
                      icon: Icons.email_rounded,
                      initialValue: state.email,
                      textError: state.textEmailError,
                      hintText: "Enter your email",
                      onChanged: (email) {
                        context.read<SignupBloc>().add(EmailChange(email));
                      },
                    ),
                    const SizedBox(height: 16.0),
                    InputWidget(
                      icon: Icons.document_scanner_rounded,
                      initialValue: state.cpf,
                      textError: state.textCpfError,
                      hintText: "Enter your CPF",
                      onChanged: (cpf) {
                        context.read<SignupBloc>().add(CpfChange(cpf));
                      },
                    ),
                    const SizedBox(height: 16.0),
                    InputWidget(
                      icon: Icons.phone_android_rounded,
                      initialValue: state.phone,
                      textError: state.textPhoneError,
                      hintText: "Enter your number",
                      onChanged: (phone) {
                        context.read<SignupBloc>().add(PhoneChange(phone));
                      },
                    ),
                    const SizedBox(height: 16.0),
                    InputWidget(
                      obscureText: true,
                      icon: Icons.password_rounded,
                      initialValue: state.password,
                      textError: state.textPasswordError,
                      hintText: "Enter your password",
                      onChanged: (password) {
                        context
                            .read<SignupBloc>()
                            .add(PasswordChange(password));
                      },
                    ),
                    const SizedBox(height: 16.0),
                    InputWidget(
                      icon: Icons.password_rounded,
                      hintText: "Confirm your password",
                      onChanged: (confirmPassword) {
                        context
                            .read<SignupBloc>()
                            .add(ConfirmPasswordChange(confirmPassword));
                      },
                    ),
                    const SizedBox(height: 32.0),
                    ButtonWidget(
                      text: "Signup",
                      isLoading: state.status == StateStatus.PENDING,
                      onPressed: () {
                        context
                            .read<SignupBloc>()
                            .add(FormSubmit((event, emit) {}));
                      },
                    )
                  ],
                );
              }),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: AppColors.text.dark,
                  ),
                ),
                GestureDetector(
                  child: const Text(
                    " Signin",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  onTap: () {
                    Routefly.navigate(routePaths.signin);
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
