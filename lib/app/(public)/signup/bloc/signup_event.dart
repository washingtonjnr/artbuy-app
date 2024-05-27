part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

// Events
class CpfChange extends SignupEvent {
  final String cpf;

  CpfChange(this.cpf);
}

class NameChange extends SignupEvent {
  final String name;

  NameChange(this.name);
}

class EmailChange extends SignupEvent {
  final String email;

  EmailChange(this.email);
}

class PhoneChange extends SignupEvent {
  final String phone;

  PhoneChange(this.phone);
}

class PasswordChange extends SignupEvent {
  final String password;

  PasswordChange(this.password);
}

class ConfirmPasswordChange extends SignupEvent {
  final String confirmPassword;

  ConfirmPasswordChange(this.confirmPassword);
}

final class FormSubmit extends SignupEvent {
  FormSubmit(
      void Function(FormSubmit event, Emitter<SignupState> emit) formSubmited);
}
