
class RequestListFriendModel {
    int? code;
    String? message;
    List<Data>? data;

    RequestListFriendModel({this.code, this.message, this.data});

    RequestListFriendModel.fromJson(Map<String, dynamic> json) {
        code = json["code"];
        message = json["message"];
        data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["code"] = code;
        _data["message"] = message;
        if(data != null) {
            _data["data"] = data?.map((e) => e.toJson()).toList();
        }
        return _data;
    }
}

class Data {
    int? userId;
    String? name;
    String? email;
    dynamic phoneNumber;
    dynamic address;
    String? role;
    dynamic birthDay;
    dynamic gender;
    dynamic avatarLocation;

    Data({this.userId, this.name, this.email, this.phoneNumber, this.address, this.role, this.birthDay, this.gender, this.avatarLocation});

    Data.fromJson(Map<String, dynamic> json) {
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