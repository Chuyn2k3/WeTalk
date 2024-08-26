
class AiDetectionModel {
    Data? data;
    String? message;
    String? status;

    AiDetectionModel({this.data, this.message, this.status});

    AiDetectionModel.fromJson(Map<String, dynamic> json) {
        data = json["data"] == null ? null : Data.fromJson(json["data"]);
        message = json["message"];
        status = json["status"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(data != null) {
            _data["data"] = data?.toJson();
        }
        _data["message"] = message;
        _data["status"] = status;
        return _data;
    }
}

class Data {
    String? confidence;
    String? content;
    String? fileLocation;

    Data({this.confidence, this.content, this.fileLocation});

    Data.fromJson(Map<String, dynamic> json) {
        confidence = json["confidence"];
        content = json["content"];
        fileLocation = json["fileLocation"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["confidence"] = confidence;
        _data["content"] = content;
        _data["fileLocation"] = fileLocation;
        return _data;
    }
}