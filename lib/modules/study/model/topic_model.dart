
class TopicModel {
  int? code;
  String? message;
  List<DataTopic>? data;

  TopicModel({this.code, this.message, this.data});

  TopicModel.fromJson(Map<String, dynamic> json) {
    if(json["code"] is int) {
      code = json["code"];
    }
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["data"] is List) {
      data = json["data"] == null ? null : (json["data"] as List).map((e) => DataTopic.fromJson(e)).toList();
    }
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

class DataTopic {
  int? topicId;
  String? content;
  dynamic imageLocation;
  dynamic videoLocation;

  DataTopic({this.topicId, this.content, this.imageLocation, this.videoLocation});

  DataTopic.fromJson(Map<String, dynamic> json) {
    if(json["topicId"] is int) {
      topicId = json["topicId"];
    }
    if(json["content"] is String) {
      content = json["content"];
    }
    imageLocation = json["imageLocation"];
    videoLocation = json["videoLocation"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["topicId"] = topicId;
    data["content"] = content;
    data["imageLocation"] = imageLocation;
    data["videoLocation"] = videoLocation;
    return data;
  }
}