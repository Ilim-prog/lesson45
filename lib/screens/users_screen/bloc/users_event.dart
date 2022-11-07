part of 'users_bloc.dart';

@immutable
abstract class UsersEvent {}

class GetAllUsersEvent extends UsersEvent {}

class GetUserEvent extends UsersEvent {
  final int id;

  GetUserEvent({required this.id});
}
