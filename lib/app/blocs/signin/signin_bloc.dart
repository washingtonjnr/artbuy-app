// Constant
import 'package:artbuy/app/core/constants/status.dart';
// Service
import 'package:artbuy/app/data/models/signin_model.dart';
// Repository
import 'package:artbuy/app/data/repositories/auth_repository.dart';
import 'package:artbuy/routes.dart';
// Libs
import 'package:bloc/bloc.dart'; // no remove
import 'package:meta/meta.dart';
import 'package:routefly/routefly.dart'; // no remove

// Bloc files
part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final AuthRepository authRepository = AuthRepository();

  SigninBloc() : super(const SigninState()) {
    on<EmailChange>(_emailChanged);
    on<PasswordChange>(_passwordChanged);
    on<FormSubmit>(_formSubmited);
  }

  void _emailChanged(EmailChange event, Emitter<SigninState> emit) {
    final email = event.email;

    emit(state.copyWith(email: email));
  }

  void _passwordChanged(PasswordChange event, Emitter<SigninState> emit) {
    final password = event.password;

    emit(state.copyWith(password: password));
  }

  Future<void> _formSubmited(
      FormSubmit event, Emitter<SigninState> emit) async {
    final email = state.email;
    final password = state.password;

    if (email.isEmpty || password.isEmpty) return;

    emit(state.copyWith(status: StateStatus.PENDING));

    try {
      final signinModel = SigninModel(email: email, password: password);
      final response = await authRepository.signin(signinModel);

      if (response.success) {
        Routefly.navigate(routePaths.dashboard.home);

        emit(state.copyWith(status: StateStatus.SUCCESS));
      } else {
        emit(state.copyWith(status: StateStatus.ERROR));
      }
    } catch (error) {
      emit(
          state.copyWith(status: StateStatus.ERROR, msgError: 'Signin failed'));
    }
  }
}
