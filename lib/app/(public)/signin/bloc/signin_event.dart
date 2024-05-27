part of 'signin_bloc.dart';

@immutable
sealed class SigninEvent {}

// Events
final class EmailChange extends SigninEvent {
  final String email;

  EmailChange(this.email);
}

final class PasswordChange extends SigninEvent {
  final String password;

  PasswordChange(this.password);
}

final class FormSubmit extends SigninEvent {
  FormSubmit(
      void Function(FormSubmit event, Emitter<SigninState> emit) formSubmited);
}
