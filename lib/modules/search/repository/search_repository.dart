import 'package:dio/dio.dart';
import 'package:flutter_app/data/term/network_term.dart';
import 'package:flutter_app/modules/search/model/search_user_model.dart';
import 'package:flutter_app/modules/study/model/classroom_model.dart';
import 'package:flutter_app/modules/study/model/topic_model.dart';
import 'package:flutter_app/modules/study/model/vocabulary_model.dart';
import 'package:flutter_app/modules/study/model/question_model.dart';
import 'package:flutter_app/service/dio_base.dart';
import 'package:flutter_app/service/store.dart';

abstract class SearchRepository {
  Future<SearchUserModel> searchUser(String text);
  // Future<TopicModel> getListTopicByClassroom(int classroomId);
  // Future<TopicModel> searchTopic(String topicName);
  // Future<ClassroomModel> getListClassroom();
  // Future<VocabularyModel> getListVocabularyByTopicId(int topicId);
  // Future<QuestionStudyModel> getAllQuestion();
  // Future<QuestionStudyModel> getQuestionByClassroom(int classroomId);
}

class SearchRepositoryImp implements SearchRepository {
  @override
  Future<SearchUserModel> searchUser(String text) async {
    final dio = await DioBase.dioGetFriendFunction();
    try {
      final response = await dio.get(ApiConstants.searchUserUrl,
          options: Options(
            method: 'get',
            headers: {
              "Authorization": "Bearer ${await Store.getToken()}",
              "Content-Type": "application/json",
            },
          ),
          queryParameters: {"text":text,"size":100}
          );
      return SearchUserModel.fromJson((response.data));
    } catch (e) {
      rethrow;
    }
  }

  // @override
  // Future<TopicModel> getListTopicByClassroom(int classroomId) async {
  //   final dio = await DioBase.dioGetStudyFunction();
  //   try {
  //     final response = await dio.get(
  //       ApiConstants.topicByClassroom + classroomId.toString(),
  //       options: Options(
  //         method: 'get',
  //         headers: {
  //           "Authorization": "Bearer ${await Store.getToken()}",
  //           "Content-Type": "application/json",
  //         },
  //       ),
  //       //queryParameters: {"classRoomId": classroomId}
  //     );
  //     return TopicModel.fromJson((response.data));
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // @override
  // Future<TopicModel> searchTopic(String topicName) async {
  //   final dio = await DioBase.dioGetStudyFunction();
  //   try {
  //     final response = await dio.get(ApiConstants.searchTopicUrl,
  //         options: Options(
  //           method: 'get',
  //           headers: {
  //             "Authorization": "Bearer ${await Store.getToken()}",
  //             "Content-Type": "application/json",
  //           },
  //         ),
  //         queryParameters: {"page": 1, "size": 10, "text": topicName});
  //     return TopicModel.fromJson((response.data));
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // @override
  // Future<ClassroomModel> getListClassroom() async {
  //   final dio = await DioBase.dioGetStudyFunction();
  //   try {
  //     final response = await dio.get(ApiConstants.getAllClassroom,
  //         options: Options(
  //           method: 'get',
  //           headers: {
  //             "Authorization": "Bearer ${await Store.getToken()}",
  //             "Content-Type": "application/json",
  //           },
  //         ));
  //     return ClassroomModel.fromJson((response.data));
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // @override
  // Future<VocabularyModel> getListVocabularyByTopicId(int topicId) async {
  //   final dio = await DioBase.dioGetStudyFunction();
  //   try {
  //     final response = await dio.get(ApiConstants.vocabularyByTopic,
  //         options: Options(
  //           method: 'get',
  //           headers: {
  //             "Authorization": "Bearer ${await Store.getToken()}",
  //             "Content-Type": "application/json",
  //           },
  //         ),
  //         queryParameters: {"topicId": topicId});
  //     return VocabularyModel.fromJson((response.data));
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // @override
  // Future<QuestionStudyModel> getAllQuestion() async {
  //   final dio = await DioBase.dioGetStudyFunction();
  //   try {
  //     final response = await dio.get(ApiConstants.getAllQuestion,
  //         options: Options(
  //           method: 'get',
  //           headers: {
  //             "Authorization": "Bearer ${await Store.getToken()}",
  //             "Content-Type": "application/json",
  //           },
  //         ));
  //     return QuestionStudyModel.fromJson((response.data));
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // @override
  // Future<QuestionStudyModel> getQuestionByClassroom(int classroomId) async {
  //   final dio = await DioBase.dioGetStudyFunction();
  //   try {
  //     final response = await dio.get(ApiConstants.getQuestionByClassroomId,
  //         options: Options(
  //           method: 'get',
  //           headers: {
  //             "Authorization": "Bearer ${await Store.getToken()}",
  //             "Content-Type": "application/json",
  //           },
  //         ),
  //         queryParameters: {"classRoomId": classroomId});
  //     return QuestionStudyModel.fromJson((response.data));
  //   } catch (e) {
  //     rethrow;
  //   }
  //}
}

