
// import 'package:flutter_app/data/term/network_term.dart';
// import 'package:flutter_app/modules/authentication/model/login_model.dart';
// import 'package:flutter_app/modules/challenge/model/question/question_model.dart';
// import 'package:flutter_app/service/dio_base.dart';
// import 'package:flutter_app/service/store.dart';

// class QuestionnRepo {
//   // static Future<void> _saveToken(Map<String, dynamic> data) async {
//   //   final token = data['access_token'];
//   //   await Store.setToken(token);
//   // }

//   static Future<QuestionModel?> diogetQuestion(String id) async {
//     final dio = await DioBase.dioGetStudyFunction();
//     try {
//       final response = await dio.get(
//         ApiConstants.getQuestionUrl+id,
//         //data: {"email": email, "password": password},
//       );
//       //await _saveToken(response.data);
//       return QuestionModel.fromJson((response.data));
//     } catch (e) {
//       // ignore: avoid_print
//       print(e);
//     }
//     return null;
//   }
// }
