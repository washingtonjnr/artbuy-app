part of 'user_bloc.dart';

@immutable
final class UserState {
  final UserModel? user;
  final StateStatus status;

  const UserState({
    this.user,
    this.status = StateStatus.IDLE,
  });

  UserState copyWith({
    UserModel? user,
    StateStatus? status,
  }) {
    return UserState(
      user: user ?? this.user,
      status: status ?? this.status,
    );
  }
}
