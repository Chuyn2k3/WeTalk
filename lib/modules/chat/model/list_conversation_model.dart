
class ListConversationModel {
    int? code;
    String? message;
    List<Data>? data;

    ListConversationModel({this.code, this.message, this.data});

    ListConversationModel.fromJson(Map<String, dynamic> json) {
        code = json["code"];
        message = json["message"];
        data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    }

   Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = <String, dynamic>{};
  data["code"] = code;
  data["message"] = message;

  // Kiểm tra xem "data" có phải là một danh sách không, rồi chuyển đổi thành JSON
  if (this.data != null && this.data is List) {
    data["data"] = (this.data as List).map((e) => e.toJson()).toList();
  }

  return data;
}
}

class Data {
    int? conversationId;
    List<GrouAttachConvResList>? grouAttachConvResList;

    Data({this.conversationId, this.grouAttachConvResList});

    Data.fromJson(Map<String, dynamic> json) {
        conversationId = json["conversationId"];
        grouAttachConvResList = json["grouAttachConvResList"] == null ? null : (json["grouAttachConvResList"] as List).map((e) => GrouAttachConvResList.fromJson(e)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data["conversationId"] = conversationId;
        if(grouAttachConvResList != null) {
            data["grouAttachConvResList"] = grouAttachConvResList?.map((e) => e.toJson()).toList();
        }
        return data;
    }
}

class GrouAttachConvResList {
    int? contactId;
    String? contactName;
    String? avatarLocation;
    String? email;
    String? lastActivity;
    LastMessageRes? lastMessageRes;

    GrouAttachConvResList({this.contactId, this.contactName, this.avatarLocation, this.email, this.lastActivity, this.lastMessageRes});

    GrouAttachConvResList.fromJson(Map<String, dynamic> json) {
        contactId = json["contactId"];
        contactName = json["contactName"];
        avatarLocation = json["avatarLocation"];
        email = json["email"];
        lastActivity = json["lastActivity"];
        lastMessageRes = json["lastMessageRes"] == null ? null : LastMessageRes.fromJson(json["lastMessageRes"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data["contactId"] = contactId;
        data["contactName"] = contactName;
        data["avatarLocation"] = avatarLocation;
        data["email"] = email;
        data["lastActivity"] = lastActivity;
        if(lastMessageRes != null) {
            data["lastMessageRes"] = lastMessageRes?.toJson();
        }
        return data;
    }
}

class LastMessageRes {
    int? messageId;
    String? content;
    String? messageType;
    dynamic mediaLocation;
    int? status;
    String? created;
    String? contactName;

    LastMessageRes({this.messageId, this.content, this.messageType, this.mediaLocation, this.status, this.created, this.contactName});

    LastMessageRes.fromJson(Map<String, dynamic> json) {
        messageId = json["messageId"];
        content = json["content"];
        messageType = json["messageType"];
        mediaLocation = json["mediaLocation"];
        status = json["status"];
        created = json["created"];
        contactName = json["contactName"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data["messageId"] = messageId;
        data["content"] = content;
        data["messageType"] = messageType;
        data["mediaLocation"] = mediaLocation;
        data["status"] = status;
        data["created"] = created;
        data["contactName"] = contactName;
        return data;
    }
}