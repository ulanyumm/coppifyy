class WebsiteHeadlineModel {
  bool? result;
  Data? data;
  String? product;
  String? keywords;
  String? toneId;
  String? audience;
  String? brand;

  WebsiteHeadlineModel({
    this.result,
    this.data,
    this.product,
    this.keywords,
    this.toneId,
    this.audience,
    this.brand,
  });

  WebsiteHeadlineModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['product'] = product;
    data['keywords'] = keywords;
    data['tone_id'] = toneId;
    data['audience'] = audience;
    data['brand'] = brand;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? remainingCredit;
  List<Headlines>? headlines;

  Data({this.remainingCredit, this.headlines});

  Data.fromJson(Map<String, dynamic> json) {
    remainingCredit = json['remaining_credit'];
    if (json['headlines'] != null) {
      headlines = <Headlines>[];
      json['headlines'].forEach((v) {
        headlines!.add(Headlines.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['remaining_credit'] = remainingCredit;
    if (headlines != null) {
      data['headlines'] = headlines!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Headlines {
  int? id;
  int? headlineId;
  String? headline;

  Headlines({this.id, this.headlineId, this.headline});

  Headlines.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    headlineId = json['headline_id'];
    headline = json['headline'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['headline_id'] = headlineId;
    data['headline'] = headline;
    return data;
  }
}
