// Constant
import 'package:artbuy/app/core/constants/status.dart';
import 'package:artbuy/app/data/adapters/user_adapter.dart';
import 'package:artbuy/app/data/models/user_model.dart';
import 'package:artbuy/app/data/repositories/auth_repository.dart';
import 'package:artbuy/app/data/repositories/user_repository.dart';
import 'package:artbuy/routes.dart';
// Libs
import 'package:bloc/bloc.dart'; // no remove
import 'package:meta/meta.dart'; // no remove
import 'package:routefly/routefly.dart';

// Bloc files
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository = UserRepository();
  final AuthRepository authRepository = AuthRepository();

  UserBloc() : super(const UserState()) {
    on<GetUser>(getUser);
  }

  Future<void> getUser(GetUser event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: StateStatus.PENDING));

    try {
      final response = await userRepository.get();

      if (response.data?.success) {
        final user = UserAdapter.fromJson(response.data?.payload);

        emit(state.copyWith(
          user: user,
          status: StateStatus.SUCCESS,
        ));
      } else {
        emit(state.copyWith(status: StateStatus.ERROR));

        return Routefly.replace(routePaths.signin);
      }
    } catch (error) {
      emit(state.copyWith(status: StateStatus.ERROR));

      await authRepository.signout();

      return Routefly.navigate(routePaths.signin);
    }
  }
}
