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
    final Map<String, dynamic> data = <String, dynamic>{};
    data["content"] = content;
    data["imageLocation"] = imageLocation;
    data["videoLocation"] = videoLocation;
    return data;
  }
}
