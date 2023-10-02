class DiscountPostModel {
  bool? result;
  Data? data;
  String? want;
  String? product;
  String? description;
  String? way;
  String? toneId;

  DiscountPostModel({
    this.result,
    this.data,
    this.want,
    this.product,
    this.description,
    this.way,
    this.toneId,
  });

  DiscountPostModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['want'] = want;
    data['product'] = product;
    data['description'] = description;
    data['way'] = way;
    data['tone_id'] = toneId;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? remainingCredit;
  List<Promotions>? promotions;

  Data({this.remainingCredit, this.promotions});

  Data.fromJson(Map<String, dynamic> json) {
    remainingCredit = json['remaining_credit'];
    if (json['promotions'] != null) {
      promotions = <Promotions>[];
      json['promotions'].forEach((v) {
        promotions!.add(Promotions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['remaining_credit'] = remainingCredit;
    if (promotions != null) {
      data['promotions'] = promotions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Promotions {
  int? id;
  int? discountId;
  String? post;

  Promotions({this.id, this.discountId, this.post});

  Promotions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    discountId = json['discount_id'];
    post = json['post'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['discount_id'] = discountId;
    data['post'] = post;
    return data;
  }
}
