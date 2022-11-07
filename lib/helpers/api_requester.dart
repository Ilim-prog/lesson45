import 'package:dio/dio.dart';
import 'package:lesson45/helpers/catch_exceptions.dart';

class ApiRequester {
  static String url = "https://jsonplaceholder.typicode.com";

  Dio initDio() {
    return Dio(
      BaseOptions(
        baseUrl: url,
        responseType: ResponseType.json,
        receiveTimeout: 10000,
        connectTimeout: 10000,
      ),
    );
  }

  Future<Response> toGet(String url) async {
    Dio dio = initDio();
    try {
      return dio.get(url);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
