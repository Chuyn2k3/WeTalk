
class MessageModel {
    int? code;
    String? message;
    List<Data>? data;

    MessageModel({this.code, this.message, this.data});

    MessageModel.fromJson(Map<String, dynamic> json) {
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
    int? messageId;
    String? content;
    String? messageType;
    String? mediaLocation;
    int? status;
    String? created;
    int? conversationId;
    int? contactId;

    Data({this.messageId, this.content, this.messageType, this.mediaLocation, this.status, this.created, this.conversationId, this.contactId});

    Data.fromJson(Map<String, dynamic> json) {
        messageId = json["messageId"];
        content = json["content"];
        messageType = json["messageType"];
        mediaLocation = json["mediaLocation"];
        status = json["status"];
        created = json["created"];
        conversationId = json["conversationId"];
        contactId = json["contactId"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data["messageId"] = messageId;
        data["content"] = content;
        data["messageType"] = messageType;
        data["mediaLocation"] = mediaLocation;
        data["status"] = status;
        data["created"] = created;
        data["conversationId"] = conversationId;
        data["contactId"] = contactId;
        return data;
    }
}