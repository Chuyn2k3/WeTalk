
import 'package:flutter_app/data/term/network_term.dart';
import 'package:flutter_app/modules/authentication/model/login_model.dart';
import 'package:flutter_app/service/dio_base.dart';
import 'package:flutter_app/service/store.dart';

class AuhthenticationRepo {
  static Future<void> _saveToken(Map<String, dynamic> data) async {
    final token = data['access_token'];
    await Store.setToken(token);
  }

  static Future<LoginDataModel?> diologin(String email, String password) async {
    final dio = await DioBase.dioWithBaseOptionLogin();
    try {
      final response = await dio.post(
        ApiConstants.loginUrl,
        data: {"email": email, "password": password},
      );
      await _saveToken(response.data);
      return LoginDataModel.fromJson((response.data));
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return null;
  }
}
