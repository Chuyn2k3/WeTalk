
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
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["code"] = code;
        _data["message"] = message;
        _data["data"] = data;
        return _data;
    }
}