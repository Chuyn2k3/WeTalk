
class ClassroomModel {
    int? code;
    String? message;
    List<Data>? data;

    ClassroomModel({this.code, this.message, this.data});

    ClassroomModel.fromJson(Map<String, dynamic> json) {
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
    int? classRoomId;
    String? content;
    String? imageLocation;

    Data({this.classRoomId, this.content, this.imageLocation});

    Data.fromJson(Map<String, dynamic> json) {
        classRoomId = json["classRoomId"];
        content = json["content"];
        imageLocation = json["imageLocation"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["classRoomId"] = classRoomId;
        _data["content"] = content;
        _data["imageLocation"] = imageLocation;
        return _data;
    }
}