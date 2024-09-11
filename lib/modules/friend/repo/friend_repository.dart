import 'package:dio/dio.dart';
import 'package:flutter_app/data/term/network_term.dart';
import 'package:flutter_app/modules/friend/model/list_friend_model.dart';
import 'package:flutter_app/modules/friend/model/request_list_friend_model.dart';
import 'package:flutter_app/modules/friend/model/sending_list_friend_model.dart';
import 'package:flutter_app/service/dio_base.dart';
import 'package:flutter_app/service/store.dart';

abstract class FriendRepository {
  Future<ListFriendModel> getListFriend();
  Future<SendingListFriendModel> getSendingListFriend();
  Future<RequestListFriendModel> getRequestListFriend();
  Future<void> addFriend(int idFriend);
  Future<void> acceptFriend(int idFriend);
}

class FriendRepositoryImp implements FriendRepository {
  @override
  Future<ListFriendModel> getListFriend() async {
    final dio = await DioBase.dioGetFriendFunction();

    try {
      final response = await dio.get(ApiConstants.getlistFriendUrl,
          options: Options(
            method: 'get',
            headers: {
              "Authorization": "Bearer ${await Store.getToken()}",
              "Content-Type": "application/json",
            },
          ));
      return ListFriendModel.fromJson((response.data));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<SendingListFriendModel> getSendingListFriend() async {
    final dio = await DioBase.dioGetFriendFunction();
    try {
      final response = await dio.get(ApiConstants.getSendingListFriendUrl,
          options: Options(
            method: 'get',
            headers: {
              "Authorization": "Bearer ${await Store.getToken()}",
              "Content-Type": "application/json",
            },
          ));
      return SendingListFriendModel.fromJson((response.data));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RequestListFriendModel> getRequestListFriend() async {
    final dio = await DioBase.dioGetFriendFunction();
    try {
      final response = await dio.get(ApiConstants.getRequestListFriendUrl,
          options: Options(
            method: 'get',
            headers: {
              "Authorization": "Bearer ${await Store.getToken()}",
              "Content-Type": "application/json",
            },
          ));
      return RequestListFriendModel.fromJson((response.data));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addFriend(int idFriend) async {
    final dio = await DioBase.dioGetFriendFunction();
    try {
      final _ = await dio.post(
        "${ApiConstants.addFriendUrl}/$idFriend",
        options: Options(
          method: 'post',
          headers: {
            "Authorization": "Bearer ${await Store.getToken()}",
            "Content-Type": "application/json",
          },
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> acceptFriend(int idFriend) async {
    final dio = await DioBase.dioGetFriendFunction();
    try {
      final _ = await dio.post(
        "${ApiConstants.acceptFriendUrl}/$idFriend",
        options: Options(
          method: 'post',
          headers: {
            "Authorization": "Bearer ${await Store.getToken()}",
            "Content-Type": "application/json",
          },
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
}
