
class QuestionStudyModel {
    int? code;
    String? message;
    List<Data>? data;

    QuestionStudyModel({this.code, this.message, this.data});

    QuestionStudyModel.fromJson(Map<String, dynamic> json) {
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
    int? questionId;
    String? content;
    String? explanation;
    String? imageLocation;
    String? videoLocation;
    String? questionType;
    String? fileType;
    List<AnswerResList>? answerResList;
    int? classRoomId;
    String? classRoomContent;

    Data({this.questionId, this.content, this.explanation, this.imageLocation, this.videoLocation, this.questionType, this.fileType, this.answerResList, this.classRoomId, this.classRoomContent});

    Data.fromJson(Map<String, dynamic> json) {
        questionId = json["questionId"];
        content = json["content"];
        explanation = json["explanation"];
        imageLocation = json["imageLocation"];
        videoLocation = json["videoLocation"];
        questionType = json["questionType"];
        fileType = json["fileType"];
        answerResList = json["answerResList"] == null ? null : (json["answerResList"] as List).map((e) => AnswerResList.fromJson(e)).toList();
        classRoomId = json["classRoomId"];
        classRoomContent = json["classRoomContent"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["questionId"] = questionId;
        _data["content"] = content;
        _data["explanation"] = explanation;
        _data["imageLocation"] = imageLocation;
        _data["videoLocation"] = videoLocation;
        _data["questionType"] = questionType;
        _data["fileType"] = fileType;
        if(answerResList != null) {
            _data["answerResList"] = answerResList?.map((e) => e.toJson()).toList();
        }
        _data["classRoomId"] = classRoomId;
        _data["classRoomContent"] = classRoomContent;
        return _data;
    }
}

class AnswerResList {
    int? answerId;
    String? content;
    String? imageLocation;
    String? videoLocation;
    int? questionId;
    bool? correct;

    AnswerResList({this.answerId, this.content, this.imageLocation, this.videoLocation, this.questionId, this.correct});

    AnswerResList.fromJson(Map<String, dynamic> json) {
        answerId = json["answerId"];
        content = json["content"];
        imageLocation = json["imageLocation"];
        videoLocation = json["videoLocation"];
        questionId = json["questionId"];
        correct = json["correct"];
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