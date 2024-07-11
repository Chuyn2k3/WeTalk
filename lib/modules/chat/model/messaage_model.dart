
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
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["code"] = code;
        _data["message"] = message;
        if(data != null) {
            _data["data"] = data?.map((e) => e.toJson()).toList();
        }
        return _data;
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
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["messageId"] = messageId;
        _data["content"] = content;
        _data["messageType"] = messageType;
        _data["mediaLocation"] = mediaLocation;
        _data["status"] = status;
        _data["created"] = created;
        _data["conversationId"] = conversationId;
        _data["contactId"] = contactId;
        return _data;
    }
}