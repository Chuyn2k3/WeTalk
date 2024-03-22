
class QuestionModel {
  int? code;
  String? message;
  List<Data>? data;

  QuestionModel({this.code, this.message, this.data});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    if(json["code"] is int) {
      code = json["code"];
    }
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["data"] is List) {
      data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
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

class Data {
  int? questionId;
  String? content;
  dynamic explanation;
  dynamic imageLocation;
  dynamic videoLocation;
  int? topicId;
  List<AnswerResList>? answerResList;

  Data({this.questionId, this.content, this.explanation, this.imageLocation, this.videoLocation, this.topicId, this.answerResList});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["questionId"] is int) {
      questionId = json["questionId"];
    }
    if(json["content"] is String) {
      content = json["content"];
    }
    explanation = json["explanation"];
    imageLocation = json["imageLocation"];
    videoLocation = json["videoLocation"];
    if(json["topicId"] is int) {
      topicId = json["topicId"];
    }
    if(json["answerResList"] is List) {
      answerResList = json["answerResList"] == null ? null : (json["answerResList"] as List).map((e) => AnswerResList.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["questionId"] = questionId;
    _data["content"] = content;
    _data["explanation"] = explanation;
    _data["imageLocation"] = imageLocation;
    _data["videoLocation"] = videoLocation;
    _data["topicId"] = topicId;
    if(answerResList != null) {
      _data["answerResList"] = answerResList?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class AnswerResList {
  int? answerId;
  String? content;
  dynamic imageLocation;
  dynamic videoLocation;
  int? questionId;
  bool? correct;

  AnswerResList({this.answerId, this.content, this.imageLocation, this.videoLocation, this.questionId, this.correct});

  AnswerResList.fromJson(Map<String, dynamic> json) {
    if(json["answerId"] is int) {
      answerId = json["answerId"];
    }
    if(json["content"] is String) {
      content = json["content"];
    }
    imageLocation = json["imageLocation"];
    videoLocation = json["videoLocation"];
    if(json["questionId"] is int) {
      questionId = json["questionId"];
    }
    if(json["correct"] is bool) {
      correct = json["correct"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["answerId"] = answerId;
    _data["content"] = content;
    _data["imageLocation"] = imageLocation;
    _data["videoLocation"] = videoLocation;
    _data["questionId"] = questionId;
    _data["correct"] = correct;
    return _data;
  }
}