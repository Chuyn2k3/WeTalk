
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
        final Map<String, dynamic> data = <String, dynamic>{};
        data["classRoomId"] = classRoomId;
        data["content"] = content;
        data["imageLocation"] = imageLocation;
        return data;
    }
}