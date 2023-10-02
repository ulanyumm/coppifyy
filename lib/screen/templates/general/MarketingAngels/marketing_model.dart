class MarketingModel {
  bool? result;
  Data? data;
  String? product;
  String? companyName;
  String? toneId;

  MarketingModel({
    this.result,
    this.data,
    this.product,
    this.companyName,
    this.toneId,
  });

  MarketingModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['product'] = product;
    data['company_name'] = companyName;
    data['tone_id'] = toneId;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? remainingCredit;
  List<Angles>? angles;

  Data({this.remainingCredit, this.angles});

  Data.fromJson(Map<String, dynamic> json) {
    remainingCredit = json['remaining_credit'];
    if (json['angles'] != null) {
      angles = <Angles>[];
      json['angles'].forEach((v) {
        angles!.add(Angles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['remaining_credit'] = remainingCredit;
    if (angles != null) {
      data['angles'] = angles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Angles {
  int? id;
  int? marketingProjectId;
  String? marketingAngle;

  Angles({this.id, this.marketingProjectId, this.marketingAngle});

  Angles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    marketingProjectId = json['marketing_project_id'];
    marketingAngle = json['marketingAngle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['marketing_project_id'] = marketingProjectId;
    data['marketingAngle'] = marketingAngle;
    return data;
  }
}
