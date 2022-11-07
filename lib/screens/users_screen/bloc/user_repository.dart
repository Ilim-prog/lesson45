import 'package:lesson45/model/user_model.dart';
import 'package:lesson45/screens/users_screen/bloc/user_provider.dart';

class UserRepository {
  UserProvider provider = UserProvider();

  Future<List<UserModel>> getAllUsers() {
    return provider.getAllUsers();
  }

  Future<UserModel> getUser(int id) {
    return provider.getUser(id);
  }
}
