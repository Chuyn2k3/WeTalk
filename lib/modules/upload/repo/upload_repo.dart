import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_app/data/term/network_term.dart';
import 'package:flutter_app/modules/friend/model/list_friend_model.dart';
import 'package:flutter_app/modules/friend/model/request_list_friend-model.dart';
import 'package:flutter_app/modules/friend/model/sending_list_friend_model.dart';
import 'package:flutter_app/modules/personal/model/user_model.dart';
import 'package:flutter_app/modules/upload/model/ai_detection_model.dart';
import 'package:flutter_app/modules/upload/model/data_collect_model.dart';
import 'package:flutter_app/modules/upload/model/history_upload_model.dart';
import 'package:flutter_app/modules/upload/model/url_model.dart';
import 'package:flutter_app/service/dio_base.dart';
import 'package:flutter_app/service/store.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

abstract class UploadRepository {
  Future<String> getUrlLink(File file);
  Future<HistoryUploadModel> getHistoryUpload();
  Future<AiDetectionModel> aiDetection(String linkMeida);
  Future<DataCollectModel> createUpload(Map<String,dynamic> data);
  // Future<void> addFriend(int idFriend);
  // Future<void> acceptFriend(int idFriend);
}

class UploadRepositoryImp implements UploadRepository {
  @override
  Future<String> getUrlLink(File file) async {
    final dio = await DioBase.dioGetUploadFunction();
    try {
      final multipathFile = await MultipartFile.fromFile(
        file.path,
        contentType: MediaType.parse(lookupMimeType(file.path) ?? ""),
      );
      final formData = FormData.fromMap(
        {'file': multipathFile},
      );
      final response = await dio.post(ApiConstants.getUrlLink,
          options: Options(
            method: 'post',
            headers: {
              "Authorization": "Bearer ${await Store.getToken()}",
              "Content-Type": "application/json",
            },
          ),
          data: formData);
      return (response.data as String);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<HistoryUploadModel> getHistoryUpload() async {
    final dio = await DioBase.dioGetStudyFunction();

    final response = await dio.get(ApiConstants.listHistoryCollectData,
        options: Options(
          method: 'get',
          headers: {
            "Authorization": "Bearer ${await Store.getToken()}",
            "Content-Type": "application/json",
          },
        ),
        );
    return HistoryUploadModel.fromJson((response.data));
  }

  @override
  Future<AiDetectionModel> aiDetection(String linkMedia) async {
    final dio = Dio(
      BaseOptions(
          baseUrl: "https://wesign.ibme.edu.vn",
          connectTimeout: const Duration(seconds: 10)),
    );

    final response = await dio.post(
      "/emg-label-tool/ai/detection",
      options: Options(
        method: 'post',
        headers: {
          "Authorization": "Bearer ${await Store.getToken()}",
          "Content-Type": "application/json",
        },
      ),
      data: {"videoUrl": linkMedia},
    );
    return AiDetectionModel.fromJson((response.data));
  }

  @override
  Future<DataCollectModel> createUpload(Map<String,dynamic> data) async {
    final dio = await DioBase.dioGetStudyFunction();

    final response = await dio.post(ApiConstants.createUpload,
        options: Options(
          method: 'post',
          headers: {
            "Authorization": "Bearer ${await Store.getToken()}",
            "Content-Type": "application/json",
          },
        ),
        data: data,);
    return DataCollectModel.fromJson((response.data));
  }
  // @override
  // Future<void> acceptFriend(int idFriend) async {
  //   final dio = await DioBase.dioGetFriendFunction();

  //   await dio.post(
  //     "${ApiConstants.acceptFriendUrl}/$idFriend",
  //   );
  // }
}
