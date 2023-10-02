class FacebookAdsModel {
  bool? result;
  Data? data;
  String? product;
  String? keywords;
  String? toneId;
  String? audience;
  String? brand;

  FacebookAdsModel({
    this.result,
    this.data,
    this.brand,
    this.keywords,
    this.toneId,
    this.audience,
  });

  FacebookAdsModel.fromJson(Map<String, dynamic> json) {
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
  List<FaceAds>? faceAds;

  Data({this.remainingCredit, this.faceAds});

  Data.fromJson(Map<String, dynamic> json) {
    remainingCredit = json['remaining_credit'];
    if (json['face_ads'] != null) {
      faceAds = <FaceAds>[];
      json['face_ads'].forEach((v) {
        faceAds!.add(FaceAds.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['remaining_credit'] = remainingCredit;
    if (faceAds != null) {
      data['face_ads'] = faceAds!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FaceAds {
  int? id;
  int? faceId;
  FaceAdsv? faceAds;

  FaceAds({this.id, this.faceId, this.faceAds});

  FaceAds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    faceId = json['face_id'];
    faceAds = json['face_ads'] != null
        ? FaceAdsv.fromJson(json['face_ads'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['face_id'] = faceId;
    if (faceAds != null) {
      data['face_ads'] = faceAds!.toJson();
    }
    return data;
  }
}

class FaceAdsv {
  String? headline;
  String? content;

  FaceAdsv({this.headline, this.content});

  FaceAdsv.fromJson(Map<String, dynamic> json) {
    headline = json['headline'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['headline'] = headline;
    data['content'] = content;
    return data;
  }
}
