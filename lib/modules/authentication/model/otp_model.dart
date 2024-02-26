
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
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["message"] = message;
    _data["data"] = data;
    return _data;
  }
}