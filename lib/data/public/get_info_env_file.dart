import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<String?> getApiUrl() async {
  await dotenv.load(fileName: ".env");
  String? apiUrl = dotenv.env['REGISTER_URL'];
  return apiUrl;
}

Future<String?> getUserUrl() async {
  await dotenv.load(fileName: ".env");
  String? apiUrl = dotenv.env['USER_URL'];
  return apiUrl;
}

Future<String?> getLoginUrl() async {
  await dotenv.load(fileName: ".env");
  String? apiUrl = dotenv.env['LOGIN_URL'];
  return apiUrl;
}

Future<String?> getStudyUrl() async {
  await dotenv.load(fileName: ".env");
  String? apiUrl = dotenv.env['STUDY_URL'];
  return apiUrl;
}

Future<String?> getFriendUrl() async {
  await dotenv.load(fileName: ".env");
  String? apiUrl = dotenv.env['FRIEND_URL'];
  return apiUrl;
}

Future<String?> getChatUrl() async {
  await dotenv.load(fileName: ".env");
  String? apiUrl = dotenv.env['CHAT_URL'];
  return apiUrl;
}

Future<String?> getUploadUrl() async {
  await dotenv.load(fileName: ".env");
  String? apiUrl = dotenv.env['UPLOAD_URL'];
  return apiUrl;
}
