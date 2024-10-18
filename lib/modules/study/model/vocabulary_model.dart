class VocabularyModel {
  int? code;
  String? message;
  List<Data>? data;

  VocabularyModel({this.code, this.message, this.data});

  VocabularyModel.fromJson(Map<String, dynamic> json) {
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
  int? vocabularyId;
  String? content;
  dynamic note;
  String? vocabularyType;
  List<VocabularyImageResList>? vocabularyImageResList;
  List<VocabularyVideoResList>? vocabularyVideoResList;
  int? topicId;
  String? topicContent;

  Data(
      {this.vocabularyId,
      this.content,
      this.note,
      this.vocabularyType,
      this.vocabularyImageResList,
      this.vocabularyVideoResList,
      this.topicId,
      this.topicContent});

  Data.fromJson(Map<String, dynamic> json) {
    vocabularyId = json["vocabularyId"];
    content = json["content"];
    note = json["note"];
    vocabularyType = json["vocabularyType"];
    vocabularyImageResList = json["vocabularyImageResList"] == null
        ? null
        : (json["vocabularyImageResList"] as List)
            .map((e) => VocabularyImageResList.fromJson(e))
            .toList();
    vocabularyVideoResList = json["vocabularyVideoResList"] == null
        ? null
        : (json["vocabularyVideoResList"] as List)
            .map((e) => VocabularyVideoResList.fromJson(e))
            .toList();
    topicId = json["topicId"];
    topicContent = json["topicContent"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["vocabularyId"] = vocabularyId;
    data["content"] = content;
    data["note"] = note;
    data["vocabularyType"] = vocabularyType;
    if (vocabularyImageResList != null) {
      data["vocabularyImageResList"] =
          vocabularyImageResList?.map((e) => e.toJson()).toList();
    }
    if (vocabularyVideoResList != null) {
      data["vocabularyVideoResList"] =
          vocabularyVideoResList?.map((e) => e.toJson()).toList();
    }
    data["topicId"] = topicId;
    data["topicContent"] = topicContent;
    return data;
  }
}

class VocabularyVideoResList {
  int? vocabularyVideoId;
  String? videoLocation;
  int? vocabularyId;
  String? vocabularyContent;
  bool? primary;

  VocabularyVideoResList(
      {this.vocabularyVideoId,
      this.videoLocation,
      this.vocabularyId,
      this.vocabularyContent,
      this.primary});

  VocabularyVideoResList.fromJson(Map<String, dynamic> json) {
    vocabularyVideoId = json["vocabularyVideoId"];
    videoLocation = json["videoLocation"];
    vocabularyId = json["vocabularyId"];
    vocabularyContent = json["vocabularyContent"];
    primary = json["primary"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["vocabularyVideoId"] = vocabularyVideoId;
    data["videoLocation"] = videoLocation;
    data["vocabularyId"] = vocabularyId;
    data["vocabularyContent"] = vocabularyContent;
    data["primary"] = primary;
    return data;
  }
}

class VocabularyImageResList {
  int? vocabularyImageId;
  String? imageLocation;
  int? vocabularyId;
  String? vocabularyContent;
  bool? primary;

  VocabularyImageResList(
      {this.vocabularyImageId,
      this.imageLocation,
      this.vocabularyId,
      this.vocabularyContent,
      this.primary});

  VocabularyImageResList.fromJson(Map<String, dynamic> json) {
    vocabularyImageId = json["vocabularyImageId"];
    imageLocation = json["imageLocation"];
    vocabularyId = json["vocabularyId"];
    vocabularyContent = json["vocabularyContent"];
    primary = json["primary"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["vocabularyImageId"] = vocabularyImageId;
    data["imageLocation"] = imageLocation;
    data["vocabularyId"] = vocabularyId;
    data["vocabularyContent"] = vocabularyContent;
    data["primary"] = primary;
    return data;
  }
}
