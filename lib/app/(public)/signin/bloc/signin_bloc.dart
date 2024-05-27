// Constants
import "package:artbuy/app/core/constants/label_errors.dart";
import "package:artbuy/app/core/constants/status.dart";
import "package:artbuy/app/core/constants/validator.dart";
import "package:artbuy/app/core/toast.dart";
// Utils
import "package:artbuy/app/core/utils/validators.dart";
// Model
import "package:artbuy/app/data/models/signin_model.dart";
// Repository
import "package:artbuy/app/data/repositories/auth_repository.dart";
// Routes
import "package:artbuy/routes.dart";
// Libs
import "package:bloc/bloc.dart"; // no remove
import "package:equatable/equatable.dart";
import "package:flutter/foundation.dart";
import "package:meta/meta.dart"; // no remove
import "package:routefly/routefly.dart";

// Bloc files
part "signin_event.dart";
part "signin_state.dart";

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final AuthRepository authRepository = AuthRepository();

  SigninBloc() : super(SigninState.initial()) {
    on<EmailChange>(_emailChanged);
    on<PasswordChange>(_passwordChanged);
    on<FormSubmit>(_formSubmited);
  }

  void _emailChanged(EmailChange event, Emitter<SigninState> emit) {
    final String email = event.email;

    emit(state.copyWith(
      email: email,
      textEmailError:
          !AppValidator.email(email) ? LabelErrors.invalidEmail : null,
    ));
  }

  void _passwordChanged(PasswordChange event, Emitter<SigninState> emit) {
    final String password = event.password;

    emit(state.copyWith(
      password: password,
      textPasswordError:
          !AppValidator.password(password) ? LabelErrors.invalidPassword : null,
    ));
  }

  Future<void> _formSubmited(
      FormSubmit event, Emitter<SigninState> emit) async {
    final String email = state.email;
    final String password = state.password;
    //
    final List<ValidatorItem> validators = [
      ValidatorItem(
        onEmitError: () =>
            emit(state.copyWith(textEmailError: LabelErrors.invalidEmail)),
        onValidator: () => AppValidator.email(email),
      ),
      ValidatorItem(
        onEmitError: () => emit(
            state.copyWith(textPasswordError: LabelErrors.invalidPassword)),
        onValidator: () => AppValidator.password(password),
      ),
    ];

    for (var item in validators) {
      if (!item.onValidator()) {
        item.onEmitError();

        return;
      }
    }

    if (state.textEmailError == null && state.textPasswordError == null) {
      emit(state.copyWith(status: StateStatus.PENDING));

      final signinModel = SigninModel(email: email, password: password);

      try {
        final response = await authRepository.signin(signinModel);

        if (response.data?.success) {
          emit(state.copyWith(status: StateStatus.SUCCESS));

          return Routefly.navigate(routePaths.home);
        } else {
          throw Exception("Invalid credentials");
        }
      } catch (e) {
        emit(state.copyWith(status: StateStatus.ERROR));

        AppToast.show("Invalid credentials", type: ToastType.error);
      }
    }
  }
}
