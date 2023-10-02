class VideoTimelineModel {
  bool? result;
  Data? data;
  String? length;
  String? about;
  String? platform;

  VideoTimelineModel({
    this.result,
    this.data,
    this.length,
    this.about,
    this.platform,
  });

  VideoTimelineModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['length'] = length;
    data['about'] = about;
    data['platform'] = platform;

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
  int? productId;
  String? description;
  String? updatedAt;
  String? createdAt;
  int? id;

  Descriptions(
      {this.productId,
      this.description,
      this.updatedAt,
      this.createdAt,
      this.id});

  Descriptions.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    description = json['description'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['description'] = description;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
