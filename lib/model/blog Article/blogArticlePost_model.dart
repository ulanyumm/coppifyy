class BlogArticlePostModel {
  bool? result;
  Data? data;
  String? introduction;
  String? conclusion;
  List<String>? outline_ids;

  BlogArticlePostModel({this.result, this.data});

  BlogArticlePostModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['introduction'] = introduction;
    data['conclusion'] = conclusion;
    data['outline_ids'] = outline_ids;

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
    data['project'] = project;
    return data;
  }
}
