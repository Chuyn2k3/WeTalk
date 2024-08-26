
class UrlLinkModel {
    int? code;
    String? message;
    Data? data;

    UrlLinkModel({this.code, this.message, this.data});

    UrlLinkModel.fromJson(Map<String, dynamic> json) {
        code = json["code"];
        message = json["message"];
        data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["code"] = code;
        _data["message"] = message;
        if(data != null) {
            _data["data"] = data?.toJson();
        }
        return _data;
    }
}

class Data {
    String? content;
    String? imageLocation;
    dynamic videoLocation;

    Data({this.content, this.imageLocation, this.videoLocation});

    Data.fromJson(Map<String, dynamic> json) {
        content = json["content"];
        imageLocation = json["imageLocation"];
        videoLocation = json["videoLocation"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["content"] = content;
        _data["imageLocation"] = imageLocation;
        _data["videoLocation"] = videoLocation;
        return _data;
    }
}