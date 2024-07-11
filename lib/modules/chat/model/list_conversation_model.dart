
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
    int? conversationId;
    List<GrouAttachConvResList>? grouAttachConvResList;

    Data({this.conversationId, this.grouAttachConvResList});

    Data.fromJson(Map<String, dynamic> json) {
        conversationId = json["conversationId"];
        grouAttachConvResList = json["grouAttachConvResList"] == null ? null : (json["grouAttachConvResList"] as List).map((e) => GrouAttachConvResList.fromJson(e)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["conversationId"] = conversationId;
        if(grouAttachConvResList != null) {
            _data["grouAttachConvResList"] = grouAttachConvResList?.map((e) => e.toJson()).toList();
        }
        return _data;
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
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["contactId"] = contactId;
        _data["contactName"] = contactName;
        _data["avatarLocation"] = avatarLocation;
        _data["email"] = email;
        _data["lastActivity"] = lastActivity;
        if(lastMessageRes != null) {
            _data["lastMessageRes"] = lastMessageRes?.toJson();
        }
        return _data;
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
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["messageId"] = messageId;
        _data["content"] = content;
        _data["messageType"] = messageType;
        _data["mediaLocation"] = mediaLocation;
        _data["status"] = status;
        _data["created"] = created;
        _data["contactName"] = contactName;
        return _data;
    }
}