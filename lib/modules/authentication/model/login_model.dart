class LoginDataModel {
  String? accessToken;
  String? refreshToken;

  LoginDataModel({this.accessToken, this.refreshToken});

  LoginDataModel.fromJson(Map<String, dynamic> json) {
    if(json["access_token"] is String) {
      accessToken = json["access_token"];
    }
    if(json["refresh_token"] is String) {
      refreshToken = json["refresh_token"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["access_token"] = accessToken;
    data["refresh_token"] = refreshToken;
    return data;
  }
}