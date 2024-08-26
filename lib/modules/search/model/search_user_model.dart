
class SearchUserModel {
    int? code;
    String? message;
    Data? data;

    SearchUserModel({this.code, this.message, this.data});

    SearchUserModel.fromJson(Map<String, dynamic> json) {
        code = json["code"];
        message = json["message"];
        data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["code"] = code;
        _data["message"] = message;
        if(data != null) {
            _data["data"] = data?.toJson();
        }
        return _data;
    }
}

class Data {
    List<Data1>? data;
    int? page;
    int? totalElements;

    Data({this.data, this.page, this.totalElements});

    Data.fromJson(Map<String, dynamic> json) {
        data = json["data"] == null ? null : (json["data"] as List).map((e) => Data1.fromJson(e)).toList();
        page = json["page"];
        totalElements = json["totalElements"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(data != null) {
            _data["data"] = data?.map((e) => e.toJson()).toList();
        }
        _data["page"] = page;
        _data["totalElements"] = totalElements;
        return _data;
    }
}

class Data1 {
    int? userId;
    String? name;
    String? email;
    dynamic phoneNumber;
    dynamic address;
    String? role;
    dynamic birthDay;
    dynamic gender;
    dynamic avatarLocation;

    Data1({this.userId, this.name, this.email, this.phoneNumber, this.address, this.role, this.birthDay, this.gender, this.avatarLocation});

    Data1.fromJson(Map<String, dynamic> json) {
        userId = json["userId"];
        name = json["name"];
        email = json["email"];
        phoneNumber = json["phoneNumber"];
        address = json["address"];
        role = json["role"];
        birthDay = json["birthDay"];
        gender = json["gender"];
        avatarLocation = json["avatarLocation"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["userId"] = userId;
        _data["name"] = name;
        _data["email"] = email;
        _data["phoneNumber"] = phoneNumber;
        _data["address"] = address;
        _data["role"] = role;
        _data["birthDay"] = birthDay;
        _data["gender"] = gender;
        _data["avatarLocation"] = avatarLocation;
        return _data;
    }
}