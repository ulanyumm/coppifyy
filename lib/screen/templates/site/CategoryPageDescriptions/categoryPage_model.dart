class CategoryPageModel {
  bool? result;
  Data? data;
  String? category;
  String? keywords;
  String? toneId;
  String? audience;
  String? companyName;

  CategoryPageModel({this.result, this.data});

  CategoryPageModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['category'] = category;
    data['keywords'] = keywords;
    data['tone_id'] = toneId;
    data['audience'] = audience;
    data['company_name'] = companyName;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? remainingCredit;
  List<Descriptions>? descriptions;

  Data({this.remainingCredit, this.descriptions});

  Data.fromJson(Map<String, dynamic> json) {
    remainingCredit = json['remaining_credit'];
    if (json['descriptions'] != null) {
      descriptions = <Descriptions>[];
      json['descriptions'].forEach((v) {
        descriptions!.add(Descriptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['remaining_credit'] = remainingCredit;
    if (descriptions != null) {
      data['descriptions'] = descriptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Descriptions {
  int? id;
  int? categoryId;
  String? description;

  Descriptions({this.id, this.categoryId, this.description});

  Descriptions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['description'] = description;
    return data;
  }
}
