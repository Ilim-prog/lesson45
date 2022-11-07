part of 'users_bloc.dart';

@immutable
abstract class UsersState {}

class UsersInitial extends UsersState {}

class UserLoadingState extends UsersState {}

class UserFetchedState extends UsersState {
  final UserModel userModel;

  UserFetchedState(this.userModel);
}

class UsersFetchedState extends UsersState {
  final List<UserModel> userModelList;

  UsersFetchedState(this.userModelList);
}

class UserErrorState extends UsersState {
  final CatchException error;

  UserErrorState({required this.error});
}
