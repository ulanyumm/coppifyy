class LandingPageModel {
  bool? result;
  Data? data;
  String? description;
  String? product;
  String? features;
  String? toneId;
  String? audience;
  String? companyName;

  LandingPageModel({
    this.result,
    this.data,
    this.description,
    this.product,
    this.features,
    this.toneId,
    this.audience,
    this.companyName,
  });

  LandingPageModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['description'] = description;
    data['product'] = product;
    data['features'] = features;
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
  List<Landingpages>? landingpages;

  Data({this.remainingCredit, this.landingpages});

  Data.fromJson(Map<String, dynamic> json) {
    remainingCredit = json['remaining_credit'];
    if (json['landingpages'] != null) {
      landingpages = <Landingpages>[];
      json['landingpages'].forEach((v) {
        landingpages!.add(Landingpages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['remaining_credit'] = remainingCredit;
    if (landingpages != null) {
      data['landingpages'] = landingpages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Landingpages {
  int? id;
  int? landingpageId;
  Landingpage? landingpage;

  Landingpages({this.id, this.landingpageId, this.landingpage});

  Landingpages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    landingpageId = json['landingpage_id'];
    landingpage = json['landingpage'] != null
        ? Landingpage.fromJson(json['landingpage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['landingpage_id'] = landingpageId;
    if (landingpage != null) {
      data['landingpage'] = landingpage!.toJson();
    }
    return data;
  }
}

class Landingpage {
  String? feature;
  String? featureDescription;

  Landingpage({this.feature, this.featureDescription});

  Landingpage.fromJson(Map<String, dynamic> json) {
    feature = json['feature'];
    featureDescription = json['feature_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['feature'] = feature;
    data['feature_description'] = featureDescription;
    return data;
  }
}
