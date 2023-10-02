class YoutubePostModel {
  bool? result;
  Data? data;
  String? videoTopic;
  String? keywords;
  String? toneId;
  String? audience;
  String? brand;

  YoutubePostModel({
    this.result,
    this.data,
    this.videoTopic,
    this.keywords,
    this.toneId,
    this.audience,
    this.brand,
  });

  YoutubePostModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['video_topic'] = videoTopic;
    data['keywords'] = keywords;
    data['tone_id'] = toneId;
    data['audience'] = audience;
    data['brand'] = brand;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? remainingCredit;
  List<YoutubeContents>? youtubeContents;

  Data({this.remainingCredit, this.youtubeContents});

  Data.fromJson(Map<String, dynamic> json) {
    remainingCredit = json['remaining_credit'];
    if (json['youtube_contents'] != null) {
      youtubeContents = <YoutubeContents>[];
      json['youtube_contents'].forEach((v) {
        youtubeContents!.add(YoutubeContents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['remaining_credit'] = remainingCredit;
    if (youtubeContents != null) {
      data['youtube_contents'] =
          youtubeContents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class YoutubeContents {
  int? id;
  int? youtubeContentId;
  YoutubeContent? youtubeContent;

  YoutubeContents({this.id, this.youtubeContentId, this.youtubeContent});

  YoutubeContents.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    youtubeContentId = json['youtube_content_id'];
    youtubeContent = json['youtube_content'] != null
        ? YoutubeContent.fromJson(json['youtube_content'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['youtube_content_id'] = youtubeContentId;
    if (youtubeContent != null) {
      data['youtube_content'] = youtubeContent!.toJson();
    }
    return data;
  }
}

class YoutubeContent {
  String? title;
  String? description;

  YoutubeContent({this.title, this.description});

  YoutubeContent.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}
