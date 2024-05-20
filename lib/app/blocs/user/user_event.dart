part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

// Events
final class GetUser extends UserEvent {
  GetUser();
}
