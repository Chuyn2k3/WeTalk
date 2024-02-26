abstract class OtpEvent {}

class FetchOtp extends OtpEvent {
  final String email;
  final int otp;
  FetchOtp(
      {required this.email,
      required this.otp});
  List<Object> get props =>
      [email, otp];
}
