class BlogArticleProjectModel {
  bool? result;
  Data? data;
  String? topic;
  List<dynamic>? keywords;
  String? viewId;
  String? audience;
  String? toneId;

  BlogArticleProjectModel({
    this.result,
    this.data,
    this.topic,
    this.keywords,
    this.viewId,
    this.audience,
    this.toneId,
  });

  BlogArticleProjectModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['topic'] = topic;
    data['keywords'] = keywords; // Doğrudan keywords listesini kullanıyoruz
    data['view_id'] = viewId;
    data['audience'] = audience;
    data['tone_id'] = toneId;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Titles>? titles;

  Data({this.titles});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['titles'] != null) {
      titles = <Titles>[];
      json['titles'].forEach((v) {
        titles!.add(Titles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (titles != null) {
      data['titles'] = titles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Titles {
  int? id;
  int? projectId;
  String? title;

  Titles({this.id, this.projectId, this.title});

  Titles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectId = json['project_id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['project_id'] = projectId;
    data['title'] = title;
    return data;
  }
}
