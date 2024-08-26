import 'package:dio/dio.dart';
import 'package:flutter_app/data/public/get_info_env_file.dart';


class DioBase {
  static Future<Dio> dioWithBaseOptionLogin() async {
    String apiUrl = await getLoginUrl() ?? '';
    final dio = Dio(
      BaseOptions(baseUrl: apiUrl, connectTimeout: const Duration(seconds: 10)),
    );

    return dio;
  }

  static Future<Dio> dioWithBaseOption() async {
    String apiUrl = await getApiUrl() ?? '';
    final dio = Dio(
      BaseOptions(baseUrl: apiUrl, connectTimeout: const Duration(seconds: 10)),
    );

    return dio;
  }

  static Future<Dio> dioGetUserFunction() async {
    String apiUrl = await getUserUrl() ?? '';
    final dio = Dio(
      BaseOptions(baseUrl: apiUrl, connectTimeout: const Duration(seconds: 10)),
    );

    return dio;
  }

  static Future<Dio> dioGetStudyFunction() async {
    String apiUrl = await getStudyUrl() ?? '';
    final dio = Dio(
      BaseOptions(baseUrl: apiUrl, connectTimeout: const Duration(seconds: 10)),
    );

    return dio;
  }

  static Future<Dio> dioGetFriendFunction() async {
    String apiUrl = await getFriendUrl() ?? '';
    final dio = Dio(
      BaseOptions(baseUrl: apiUrl, connectTimeout: const Duration(seconds: 10)),
    );

    return dio;
  }

  static Future<Dio> dioGetChatFunction() async {
    String apiUrl = await getChatUrl() ?? '';
    final dio = Dio(
      BaseOptions(baseUrl: apiUrl, connectTimeout: const Duration(seconds: 10)),
    );

    return dio;
  }
   static Future<Dio> dioGetUploadFunction() async {
    String apiUrl = await getUploadUrl() ?? '';
    final dio = Dio(
      BaseOptions(baseUrl: apiUrl, connectTimeout: const Duration(seconds: 10)),
    );

    return dio;
  }
}
