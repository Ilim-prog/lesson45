import 'package:bloc/bloc.dart';
import 'package:lesson45/helpers/catch_exceptions.dart';
import 'package:lesson45/model/user_model.dart';
import 'package:lesson45/screens/users_screen/bloc/user_repository.dart';
import 'package:meta/meta.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersInitial()) {
    UserRepository repository = UserRepository();

    on<GetAllUsersEvent>((event, emit) async {
      emit(UserLoadingState());

      try {
        List<UserModel> userModelList = await repository.getAllUsers();

        emit(UsersFetchedState(userModelList));
      } catch (e) {
        emit(UserErrorState(error: CatchException.convertException(e)));
      }
    });

    on<GetUserEvent>((event, emit) async {
      emit(UserLoadingState());

      try {
        UserModel userModel = await repository.getUser(event.id);

        emit(UserFetchedState(userModel));
      } catch (e) {
        emit(UserErrorState(error: CatchException.convertException(e)));
      }
    });
  }
}
