part of "signup_bloc.dart";

final class SignupState extends Equatable {
  final String cpf;
  final String name;
  final String email;
  final String phone;
  final String password;
  final String confirmPassword;
  final StateStatus status;
  final String? textError; // by API
  final String? textCpfError;
  final String? textNameError;
  final String? textEmailError;
  final String? textPhoneError;
  final String? textPasswordError;
  final String? textConfirmPasswordError;

  const SignupState({
    required this.cpf,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.confirmPassword,
    this.status = StateStatus.IDLE,
    this.textError,
    this.textCpfError,
    this.textNameError,
    this.textEmailError,
    this.textPhoneError,
    this.textPasswordError,
    this.textConfirmPasswordError,
  });

  factory SignupState.initial() {
    return const SignupState(
      cpf: "498.908.728-38",
      name: "Washington",
      email: "teste@teste.com",
      phone: "(11) 989756012",
      password: "Teste@123",
      confirmPassword: "Teste@123",
    );
  }

  SignupState copyWith({
    String? cpf,
    String? name,
    String? email,
    String? phone,
    String? password,
    String? confirmPassword,
    StateStatus? status,
    String? textError,
    String? textCpfError,
    String? textNameError,
    String? textEmailError,
    String? textPhoneError,
    String? textPasswordError,
    String? textConfirmPasswordError,
  }) {
    return SignupState(
      cpf: cpf ?? this.cpf,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      status: status ?? this.status,
      textError: textError,
      textCpfError: textCpfError,
      textNameError: textNameError,
      textEmailError: textEmailError,
      textPhoneError: textPhoneError,
      textPasswordError: textPasswordError,
      textConfirmPasswordError: textConfirmPasswordError,
    );
  }

  @override
  List<Object?> get props => [
    cpf,
    name,
    email,
    phone,
    password,
    confirmPassword,
    status,
    textError,
    textCpfError,
    textNameError,
    textEmailError,
    textPhoneError,
    textPasswordError,
    textConfirmPasswordError,
  ];
}

