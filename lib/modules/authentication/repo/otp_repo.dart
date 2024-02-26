
import 'package:flutter_app/data/term/network_term.dart';
import 'package:flutter_app/modules/authentication/model/otp_model.dart';
import 'package:flutter_app/service/dio_base.dart';


class OtpRepo {
  static Future<OtpModel?> dioOtp(String email, int otp) async {
    final dio = await DioBase.dioWithBaseOption();
    try {
      final response = await dio.post(
        ApiConstants.validateOtpUrl,
        data: {"email": email, "otpNum": otp},
      );
      return OtpModel.fromJson((response.data));
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return null;
  }
}
