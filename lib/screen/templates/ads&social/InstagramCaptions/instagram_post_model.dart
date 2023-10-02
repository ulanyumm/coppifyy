class InstagramPostModel {
  bool? result;
  Data? data;
  String? product;
  String? keywords;
  String? toneId;
  String? audience;
  String? brand;

  InstagramPostModel({
    this.result,
    this.data,
    this.product,
    this.keywords,
    this.toneId,
    this.audience,
    this.brand,
  });

  InstagramPostModel.fromJson(Map<String, dynamic> json) {
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
  List<InstaCaptions>? instaCaptions;

  Data({this.remainingCredit, this.instaCaptions});

  Data.fromJson(Map<String, dynamic> json) {
    remainingCredit = json['remaining_credit'];
    if (json['insta_captions'] != null) {
      instaCaptions = <InstaCaptions>[];
      json['insta_captions'].forEach((v) {
        instaCaptions!.add(InstaCaptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['remaining_credit'] = remainingCredit;
    if (instaCaptions != null) {
      data['insta_captions'] =
          instaCaptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InstaCaptions {
  int? id;
  int? instaCaptionId;
  String? instaCaption;

  InstaCaptions({this.id, this.instaCaptionId, this.instaCaption});

  InstaCaptions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    instaCaptionId = json['insta_caption_id'];
    instaCaption = json['insta_caption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['insta_caption_id'] = instaCaptionId;
    data['insta_caption'] = instaCaption;
    return data;
  }
}
