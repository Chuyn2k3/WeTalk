import 'package:dio/dio.dart';
import 'package:flutter_app/data/term/network_term.dart';
import 'package:flutter_app/modules/chat/model/list_conversation_model.dart';
import 'package:flutter_app/modules/chat/model/messaage_model.dart';
import 'package:flutter_app/service/dio_base.dart';
import 'package:flutter_app/service/store.dart';

abstract class ChatRepository {
  Future<ListConversationModel> getListConversation();
  Future<MessageModel> getMessage(int conversationId);
  Future<void> createConversation(int contactId);
  Future<void> sendMessage(String content,int conversationId, int contactId);
}

class ChatRepositoryImp implements ChatRepository {
  @override
  Future<ListConversationModel> getListConversation() async {
    final dio = await DioBase.dioGetChatFunction();
    try {
      final response = await dio.get(ApiConstants.getListConversationUrl,
          options: Options(
            method: 'get',
            headers: {
              "Authorization": "Bearer ${await Store.getToken()}",
              "Content-Type": "application/json",
            },
          ));
      return ListConversationModel.fromJson((response.data));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> createConversation(int contactId) async {
    final dio = await DioBase.dioGetChatFunction();
    try {
      final _ = await dio.post(ApiConstants.createConversationUrl,
          options: Options(
            method: 'post',
            headers: {
              "Authorization": "Bearer ${await Store.getToken()}",
              "Content-Type": "application/json",
            },
          ),
          data: {
            {
              "conversationName": "chat",
              "conversationType": "SINGLE",
              "contactIds": [contactId]
            }
          });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MessageModel> getMessage(int conversationId) async {
    final dio = await DioBase.dioGetChatFunction();
    try {
      final response = await dio.get(ApiConstants.getListConversationUrl,
          options: Options(
            method: 'get',
            headers: {
              "Authorization": "Bearer ${await Store.getToken()}",
              "Content-Type": "application/json",
            },
          ));
      return MessageModel.fromJson((response.data));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> sendMessage(String content,int conversationId, int contactId) async {
    final dio = await DioBase.dioGetChatFunction();
    try {
      final _ = await dio.post(ApiConstants.createConversationUrl,
          options: Options(
            method: 'post',
            headers: {
              "Authorization": "Bearer ${await Store.getToken()}",
              "Content-Type": "application/json",
            },
          ),
          data: {
            "messageReq": {
              "content": content,
              "messageType": "TEXT",
              "mediaLocation": "string",
              "contactId": contactId
            },
            "conversationId": conversationId
          });
    } catch (e) {
      rethrow;
    }
  }
}
