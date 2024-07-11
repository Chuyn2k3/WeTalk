import 'package:dio/dio.dart';
import 'package:flutter_app/data/term/network_term.dart';
import 'package:flutter_app/modules/friend/model/list_friend_model.dart';
import 'package:flutter_app/modules/friend/model/request_list_friend-model.dart';
import 'package:flutter_app/modules/friend/model/sending_list_friend_model.dart';
import 'package:flutter_app/modules/personal/model/user_model.dart';
import 'package:flutter_app/service/dio_base.dart';
import 'package:flutter_app/service/store.dart';

abstract class UserRepository {
  Future<UserModel> getUserInfo();
  // Future<SendingListFriendModel> getSendingListFriend();
  // Future<RequestListFriendModel> getRequestListFriend();
  // Future<void> addFriend(int idFriend);
  // Future<void> acceptFriend(int idFriend);
}

class UserRepositoryImp implements UserRepository {
  @override
  Future<UserModel> getUserInfo() async {
    final dio = await DioBase.dioGetChatFunction();
    try {
      final response = await dio.get(ApiConstants.userUrl,
          options: Options(
            method: 'get',
            headers: {
              "Authorization": "Bearer ${await Store.getToken()}",
              "Content-Type": "application/json",
            },
          ));
      return UserModel.fromJson((response.data));
    } catch (e) {
      rethrow;
    }
  }

  // @override
  // Future<SendingListFriendModel> getSendingListFriend() async {
  //   final dio = await DioBase.dioGetFriendFunction();

  //   final response = await dio.get(
  //     ApiConstants.getSendingListFriendUrl,
  //   );
  //   return SendingListFriendModel.fromJson((response.data));
  // }

  // @override
  // Future<RequestListFriendModel> getRequestListFriend() async {
  //   final dio = await DioBase.dioGetFriendFunction();

  //   final response = await dio.get(
  //     ApiConstants.getRequestListFriendUrl,
  //   );
  //   return RequestListFriendModel.fromJson((response.data));
  // }

  // @override
  // Future<void> addFriend(int idFriend) async {
  //   final dio = await DioBase.dioGetFriendFunction();

  //   await dio.post(
  //     "${ApiConstants.addFriendUrl}/$idFriend",
  //   );
  // }
  // @override
  // Future<void> acceptFriend(int idFriend) async {
  //   final dio = await DioBase.dioGetFriendFunction();

  //   await dio.post(
  //     "${ApiConstants.acceptFriendUrl}/$idFriend",
  //   );
  // }
}
