class MetaTitleModel {
  bool? result;
  Data? data;
  String? product;
  String? keywords;

  MetaTitleModel({this.result, this.data});

  MetaTitleModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['product'] = product;
    data['keywords'] = keywords;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? remainingCredit;
  List<MetaTitlesss>? metaTitles;

  Data({this.remainingCredit, this.metaTitles});

  Data.fromJson(Map<String, dynamic> json) {
    remainingCredit = json['remaining_credit'];
    if (json['meta_titles'] != null) {
      metaTitles = <MetaTitlesss>[];
      json['meta_titles'].forEach((v) {
        metaTitles!.add(MetaTitlesss.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['remaining_credit'] = remainingCredit;
    if (metaTitles != null) {
      data['meta_titles'] = metaTitles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MetaTitlesss {
  int? id;
  int? metaId;
  MetaTitles2? metaTitles;

  MetaTitlesss({this.id, this.metaId, this.metaTitles});

  MetaTitlesss.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    metaId = json['meta_id'];
    metaTitles = json['meta_titles'] != null
        ? MetaTitles2.fromJson(json['meta_titles'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['meta_id'] = metaId;
    if (metaTitles != null) {
      data['meta_titles'] = metaTitles!.toJson();
    }
    return data;
  }
}

class MetaTitles2 {
  String? metaTitle;
  String? description;

  MetaTitles2({this.metaTitle, this.description});

  MetaTitles2.fromJson(Map<String, dynamic> json) {
    metaTitle = json['meta_title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['meta_title'] = metaTitle;
    data['description'] = description;
    return data;
  }
}
