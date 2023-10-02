class BlogIdeasModel {
  bool? result;
  Data? data;
  String? about;

  BlogIdeasModel({this.result, this.data});

  BlogIdeasModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['about'] = about;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? remainingCredit;
  Descriptions? descriptions;

  Data({this.remainingCredit, this.descriptions});

  Data.fromJson(Map<String, dynamic> json) {
    remainingCredit = json['remaining_credit'];
    descriptions = json['descriptions'] != null
        ? Descriptions.fromJson(json['descriptions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['remaining_credit'] = remainingCredit;
    if (descriptions != null) {
      data['descriptions'] = descriptions!.toJson();
    }
    return data;
  }
}

class Descriptions {
  int? id;
  int? productId;
  String? description;

  Descriptions({this.id, this.productId, this.description});

  Descriptions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['description'] = description;
    return data;
  }
}
