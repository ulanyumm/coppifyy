class BlogArticleOutlineAddModel {
  bool? result;
  Data? data;
  String? outline;
  String? titleId;

  BlogArticleOutlineAddModel({this.result, this.data});

  BlogArticleOutlineAddModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Null? project;

  Data({this.project});

  Data.fromJson(Map<String, dynamic> json) {
    project = json['project'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['project'] = this.project;
    return data;
  }
}
