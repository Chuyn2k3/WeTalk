
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
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["message"] = message;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
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
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["topicId"] = topicId;
    _data["content"] = content;
    _data["imageLocation"] = imageLocation;
    _data["videoLocation"] = videoLocation;
    return _data;
  }
}