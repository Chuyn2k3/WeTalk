
class OtpModel {
  int? code;
  String? message;
  dynamic data;

  OtpModel({this.code, this.message, this.data});

  OtpModel.fromJson(Map<String, dynamic> json) {
    if(json["code"] is int) {
      code = json["code"];
    }
    if(json["message"] is String) {
      message = json["message"];
    }
    data = json["data"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["code"] = code;
    data["message"] = message;
    data["data"] = data;
    return data;
  }
}