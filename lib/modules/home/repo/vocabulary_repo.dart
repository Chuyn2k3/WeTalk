import 'package:dio/dio.dart';
import 'package:flutter_app/data/term/network_term.dart';

import 'package:flutter_app/modules/study/model/vocabulary_model.dart';
import 'package:flutter_app/service/dio_base.dart';
import 'package:flutter_app/service/store.dart';

abstract class VocabularyRepository {
  Future<VocabularyModel> getVocabularyByTopic();
}

class VocabularyRepositoryImp implements VocabularyRepository {
  @override
  Future<VocabularyModel> getVocabularyByTopic() async {
    final dio = await DioBase.dioGetStudyFunction();
    try {
      final response = await dio.get(ApiConstants.vocabularyByTopic,
          options: Options(
            method: 'get',
            headers: {
              "Authorization": "Bearer ${await Store.getToken()}",
              "Content-Type": "application/json",
            },
          ),
          queryParameters: {'page': 1, 'size': 10, 'topicId': 10});
      return VocabularyModel.fromJson((response.data));
    } catch (e) {
      rethrow;
    }
  }
}
