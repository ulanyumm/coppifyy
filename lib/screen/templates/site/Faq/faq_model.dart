class FaqModel {
  bool? result;
  Data? data;
  String? productName;
  String? productDescription;
  String? audience;
  String? toneId;

  FaqModel({
    this.result,
    this.data,
    this.productName,
    this.productDescription,
    this.audience,
    this.toneId,
  });

  FaqModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['product_name'] = productName;
    data['product_description'] = productDescription;
    data['audience'] = audience;
    data['tone_id'] = toneId;
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
