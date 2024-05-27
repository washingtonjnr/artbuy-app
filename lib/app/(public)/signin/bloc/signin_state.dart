part of 'signin_bloc.dart';

final class SigninState extends Equatable {
  final String email;
  final String password;
  final StateStatus status;
  final String? textError;
  final String? textEmailError;
  final String? textPasswordError;

  const SigninState({
    required this.email,
    required this.password,
    this.status = StateStatus.IDLE,
    this.textError,
    this.textEmailError,
    this.textPasswordError,
  });

  factory SigninState.initial() {
    return const SigninState(email: "junior@araujo.com", password: "Teste123");
  }

  SigninState copyWith({
    String? email,
    String? password,
    StateStatus? status,
    String? textError,
    String? textEmailError,
    String? textPasswordError,
  }) {
    return SigninState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      textError: textError,
      textEmailError: textEmailError,
      textPasswordError: textPasswordError,
    );
  }

  @override
  List<Object?> get props =>
      [email, password, status, textError, textEmailError, textPasswordError];
}
