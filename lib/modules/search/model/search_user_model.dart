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
  List<Data1>? data;
  int? page;
  int? totalElements;

  Data({this.data, this.page, this.totalElements});

  Data.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => Data1.fromJson(e)).toList();
    page = json["page"];
    totalElements = json["totalElements"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["page"] = page;
    data["totalElements"] = totalElements;

    // Kiểm tra xem "data" có phải là một danh sách không, rồi chuyển đổi thành JSON
    if (this.data != null && this.data is List) {
      data["data"] = (this.data as List).map((e) => e.toJson()).toList();
    }

    return data;
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

  Data1(
      {this.userId,
      this.name,
      this.email,
      this.phoneNumber,
      this.address,
      this.role,
      this.birthDay,
      this.gender,
      this.avatarLocation});

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
