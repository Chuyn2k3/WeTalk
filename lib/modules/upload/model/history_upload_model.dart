class HistoryUploadModel {
  int? code;
  String? message;
  List<Data>? data;

  HistoryUploadModel({this.code, this.message, this.data});

  HistoryUploadModel.fromJson(Map<String, dynamic> json) {
    code = json["code"];
    message = json["message"];
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
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
  int? dataCollectionId;
  String? dataLocation;
  dynamic detectionContent;
  String? volunteerEmail;
  dynamic adminEmail;
  int? status;
  double? score;
  dynamic feedBack;
  String? createdDate;
  String? modifiedDate;
  String? modifiedBy;
  int? vocabularyId;
  String? vocabularyContent;

  Data(
      {this.dataCollectionId,
      this.dataLocation,
      this.detectionContent,
      this.volunteerEmail,
      this.adminEmail,
      this.status,
      this.score,
      this.feedBack,
      this.createdDate,
      this.modifiedDate,
      this.modifiedBy,
      this.vocabularyId,
      this.vocabularyContent});

  Data.fromJson(Map<String, dynamic> json) {
    dataCollectionId = json["dataCollectionId"];
    dataLocation = json["dataLocation"];
    detectionContent = json["detectionContent"];
    volunteerEmail = json["volunteerEmail"];
    adminEmail = json["adminEmail"];
    status = json["status"];
    score = json["score"];
    feedBack = json["feedBack"];
    createdDate = json["createdDate"];
    modifiedDate = json["modifiedDate"];
    modifiedBy = json["modifiedBy"];
    vocabularyId = json["vocabularyId"];
    vocabularyContent = json["vocabularyContent"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["dataCollectionId"] = dataCollectionId;
    data["dataLocation"] = dataLocation;
    data["detectionContent"] = detectionContent;
    data["volunteerEmail"] = volunteerEmail;
    data["adminEmail"] = adminEmail;
    data["status"] = status;
    data["score"] = score;
    data["feedBack"] = feedBack;
    data["createdDate"] = createdDate;
    data["modifiedDate"] = modifiedDate;
    data["modifiedBy"] = modifiedBy;
    data["vocabularyId"] = vocabularyId;
    data["vocabularyContent"] = vocabularyContent;
    return data;
  }
}
