class ArticleGeneratorModel {
  bool? result;
  Data? data;
  String? title;
  String? type;
  List<dynamic>? keywords;
  List<dynamic>? outlines;
  String? audience;

  ArticleGeneratorModel({
    this.result,
    this.data,
    this.title,
    this.type,
    this.keywords,
    this.outlines,
    this.audience,
  });

  ArticleGeneratorModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['title'] = title;
    data['type'] = type;
    data['keywords'] = keywords;
    data['outlines'] = outlines;
    data['audience'] = audience;

    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Project? project;

  Data({this.project});

  Data.fromJson(Map<String, dynamic> json) {
    project =
        json['project'] != null ? Project.fromJson(json['project']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (project != null) {
      data['project'] = project!.toJson();
    }
    return data;
  }
}

class Project {
  int? id;
  String? userId;
  String? type;
  String? title;
  List<String>? keywords;
  List<String>? outlines;
  String? audience;
  String? createdAt;
  String? updatedAt;

  Project(
      {this.id,
      this.userId,
      this.type,
      this.title,
      this.keywords,
      this.outlines,
      this.audience,
      this.createdAt,
      this.updatedAt});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    type = json['type'];
    title = json['title'];
    keywords = json['keywords'].cast<String>();
    outlines = json['outlines'].cast<String>();
    audience = json['audience'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['type'] = type;
    data['title'] = title;
    data['keywords'] = keywords;
    data['outlines'] = outlines;
    data['audience'] = audience;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
