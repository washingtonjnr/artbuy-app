part of 'signin_bloc.dart';

@immutable
final class SigninState {
  final String email;
  final String password;
  final String? msgError;
  final StateStatus status;

  const SigninState({
    this.email = "",
    this.password = "",
    this.msgError,
    this.status = StateStatus.IDLE,
  });

  SigninState copyWith({
    String? email,
    String? password,
    String? msgError,
    StateStatus? status,
  }) {
    return SigninState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      msgError: msgError ?? this.msgError,
    );
  }
}
