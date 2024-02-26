import 'package:flutter_app/modules/authentication/model/otp_model.dart';

abstract class OtpState {}

class OtpInitial extends OtpState {}

class OtpLoading extends OtpState {}

class OtpLoaded extends OtpState {
  final OtpModel data;
  OtpLoaded({required this.data});
}

class OtpError extends OtpState {
  final String error;
  OtpError({required this.error});
}
class OtpErrorApi extends OtpState {
  final String error;
  OtpErrorApi({required this.error});
}
