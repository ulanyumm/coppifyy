class GooglePostModel {
  bool? result;
  Data? data;
  String? product;
  String? keywords;
  String? toneId;
  String? audience;
  String? brand;

  GooglePostModel({this.result, this.data});

  GooglePostModel.fromJson(Map<String, dynamic> json) {
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
  List<GoogleAds>? googleAds;

  Data({this.remainingCredit, this.googleAds});

  Data.fromJson(Map<String, dynamic> json) {
    remainingCredit = json['remaining_credit'];
    if (json['google_ads'] != null) {
      googleAds = <GoogleAds>[];
      json['google_ads'].forEach((v) {
        googleAds!.add(GoogleAds.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['remaining_credit'] = remainingCredit;
    if (googleAds != null) {
      data['google_ads'] = googleAds!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GoogleAds {
  int? id;
  int? googleAdsId;
  GoogleAdsV? googleAds;

  GoogleAds({this.id, this.googleAdsId, this.googleAds});

  GoogleAds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    googleAdsId = json['google_ads_id'];
    googleAds = json['google_ads'] != null
        ? GoogleAdsV.fromJson(json['google_ads'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['google_ads_id'] = googleAdsId;
    if (googleAds != null) {
      data['google_ads'] = googleAds!.toJson();
    }
    return data;
  }
}

class GoogleAdsV {
  String? headline;
  String? description;

  GoogleAdsV({this.headline, this.description});

  GoogleAdsV.fromJson(Map<String, dynamic> json) {
    headline = json['headline'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['headline'] = headline;
    data['description'] = description;
    return data;
  }
}
