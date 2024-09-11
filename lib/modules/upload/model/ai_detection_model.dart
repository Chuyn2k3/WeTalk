
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
  final Map<String, dynamic> data = <String, dynamic>{};
   data["status"] = status;
  data["message"] = message;

  // Kiểm tra xem "data" có phải là một danh sách không, rồi chuyển đổi thành JSON
  if (this.data != null && this.data is List) {
    data["data"] = (this.data as List).map((e) => e.toJson()).toList();
  }

  return data;
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
        final Map<String, dynamic> data = <String, dynamic>{};
        data["confidence"] = confidence;
        data["content"] = content;
        data["fileLocation"] = fileLocation;
        return data;
    }
}