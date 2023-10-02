class BlogArticleOutlineCreateModel {
  bool? result;
  Data? data;
  String? titleId;

  BlogArticleOutlineCreateModel({this.result, this.data});

  BlogArticleOutlineCreateModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['title_id'] = titleId;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Null project;

  Data({this.project});

  Data.fromJson(Map<String, dynamic> json) {
    project = json['project'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['project'] = this.project;
    return data;
  }
}
