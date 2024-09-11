
class DataCollectModel {
    int? code;
    String? message;
    dynamic data;

    DataCollectModel({this.code, this.message, this.data});

    DataCollectModel.fromJson(Map<String, dynamic> json) {
        code = json["code"];
        message = json["message"];
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