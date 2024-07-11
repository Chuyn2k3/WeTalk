
class UserModel {
    int? code;
    String? message;
    Data? data;

    UserModel({this.code, this.message, this.data});

    UserModel.fromJson(Map<String, dynamic> json) {
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
    int? userId;
    String? name;
    String? email;
    String? phoneNumber;
    String? address;
    String? role;
    String? birthDay;
    String? gender;
    String? avatarLocation;

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