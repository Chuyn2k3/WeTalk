
class ListFriendModel {
    int? code;
    String? message;
    List<Data>? data;

    ListFriendModel({this.code, this.message, this.data});

    ListFriendModel.fromJson(Map<String, dynamic> json) {
        code = json["code"];
        message = json["message"];
        data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    }

   Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = <String, dynamic>{};
  data["code"] = code;
  data["message"] = message;

  // Kiểm tra xem "data" có phải là một danh sách không, rồi chuyển đổi thành JSON
  if (this.data != null && this.data is List) {
    data["data"] = (this.data as List).map((e) => e.toJson()).toList();
  }

  return data;
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
        final Map<String, dynamic> data = <String, dynamic>{};
        data["userId"] = userId;
        data["name"] = name;
        data["email"] = email;
        data["phoneNumber"] = phoneNumber;
        data["address"] = address;
        data["role"] = role;
        data["birthDay"] = birthDay;
        data["gender"] = gender;
        data["avatarLocation"] = avatarLocation;
        return data;
    }
}