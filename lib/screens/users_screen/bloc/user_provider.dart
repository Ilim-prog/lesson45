import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:lesson45/helpers/api_requester.dart';
import 'package:lesson45/helpers/catch_exceptions.dart';
import 'package:lesson45/model/user_model.dart';

class UserProvider {
  ApiRequester apiRequester = ApiRequester();

  Future<List<UserModel>> getAllUsers() async {
    try {
      Response response = await apiRequester.toGet("/users");
      print(response.data);

      if (response.statusCode == 200) {
        return response.data
            .map<UserModel>((e) => UserModel.fromJson(e))
            .toList();
      }

      throw CatchException.convertException(response);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }

  Future<UserModel> getUser(int id) async {
    try {
      Response response = await apiRequester.toGet("/users/$id");

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      }

      throw CatchException.convertException(response);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
