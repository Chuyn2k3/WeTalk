import 'package:flutter_app/data/term/network_term.dart';
import 'package:flutter_app/modules/study/model/topic_model.dart';
import 'package:flutter_app/service/dio_base.dart';

class StudyRepo {

  static Future<TopicModel?> diogetAllTopic() async {
    final dio = await DioBase.dioGetStudyFunction();
    try {
      final response = await dio.get(
        ApiConstants.allTopicUrl,
        //data: {"email": email, "password": password},
      );
      //await _saveToken(response.data);
      return TopicModel.fromJson((response.data));
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return null;
  }
}