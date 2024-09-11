
class ResgisterModel {
  int? code;
  String? message;
  dynamic data;

  ResgisterModel({this.code, this.message, this.data});

  ResgisterModel.fromJson(Map<String, dynamic> json) {
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