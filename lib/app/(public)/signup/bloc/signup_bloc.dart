import 'package:artbuy/app/core/constants/label_errors.dart';
import 'package:artbuy/app/core/constants/status.dart';
import 'package:artbuy/app/core/utils/validators.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupState.initial()) {
    on<CpfChange>(_cpfChange);
    on<NameChange>(_nameChange);
    on<EmailChange>(_emailChange);
    on<PhoneChange>(_phoneChange);
    on<PasswordChange>(_passwordChange);
    on<ConfirmPasswordChange>(_confirmPasswordChange);
    on<FormSubmit>(_formSubmited);
  }

  void _cpfChange(CpfChange event, Emitter<SignupState> emitter) {
    final String cpf = event.cpf;

    emitter(state.copyWith(
      cpf: cpf,
      textCpfError: !AppValidator.cpf(cpf) ? LabelErrors.invalidCPF : null,
    ));
  }

  void _nameChange(NameChange event, Emitter<SignupState> emitter) {
    final String name = event.name;

    emitter(state.copyWith(
      name: name,
      textNameError: !AppValidator.name(name) ? LabelErrors.invalidEmail : null,
    ));
  }

  void _emailChange(EmailChange event, Emitter<SignupState> emitter) {}

  void _phoneChange(PhoneChange event, Emitter<SignupState> emitter) {}

  void _passwordChange(PasswordChange event, Emitter<SignupState> emitter) {}

  void _confirmPasswordChange(
      ConfirmPasswordChange event, Emitter<SignupState> emitter) {}

  Future<void> _formSubmited(
      FormSubmit event, Emitter<SignupState> emit) async {}
}
