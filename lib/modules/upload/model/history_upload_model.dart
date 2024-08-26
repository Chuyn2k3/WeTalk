class HistoryUploadModel {
    int? code;
    String? message;
    List<Data>? data;

    HistoryUploadModel({this.code, this.message, this.data});

    HistoryUploadModel.fromJson(Map<String, dynamic> json) {
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

    Data({this.dataCollectionId, this.dataLocation, this.detectionContent, this.volunteerEmail, this.adminEmail, this.status, this.score, this.feedBack, this.createdDate, this.modifiedDate, this.modifiedBy, this.vocabularyId, this.vocabularyContent});

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
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["dataCollectionId"] = dataCollectionId;
        _data["dataLocation"] = dataLocation;
        _data["detectionContent"] = detectionContent;
        _data["volunteerEmail"] = volunteerEmail;
        _data["adminEmail"] = adminEmail;
        _data["status"] = status;
        _data["score"] = score;
        _data["feedBack"] = feedBack;
        _data["createdDate"] = createdDate;
        _data["modifiedDate"] = modifiedDate;
        _data["modifiedBy"] = modifiedBy;
        _data["vocabularyId"] = vocabularyId;
        _data["vocabularyContent"] = vocabularyContent;
        return _data;
    }

}
