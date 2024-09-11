import 'package:flutter_app/data/term/network_term.dart';
import 'package:flutter_app/modules/authentication/model/resgister_model.dart';
import 'package:flutter_app/service/dio_base.dart';

class RegisterGenerateOtpRepo {

  static Future<ResgisterModel?> dioRegisterGenerateOtp(String name,String email, String password,String phone, String address, String gender, int age) async {
    final dio = await DioBase.dioWithBaseOption();
    try {
      final response = await dio.post(
        ApiConstants.generateOtpUrl,
        data: {"name": name,
  "email": email,
  "password": password,
  "phoneNumber": phone,
  "address": address,
  "age": age,
  "gender": gender},
      );
      return ResgisterModel.fromJson((response.data));
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return null;
  }
}
