class BioWriterModel {
  bool? result;
  Data? data;
  String? object;
  String? companyName;
  String? keywords;
  String? viewId;
  String? audience;
  String? brand;

  BioWriterModel({
    this.result,
    this.data,
    this.object,
    this.companyName,
    this.keywords,
    this.viewId,
    this.audience,
    this.brand,
  });

  BioWriterModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['object'] = object;
    data['company_name'] = companyName;
    data['keywords'] = keywords;
    data['view_id'] = viewId;
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
  List<Bios>? bios;

  Data({this.remainingCredit, this.bios});

  Data.fromJson(Map<String, dynamic> json) {
    remainingCredit = json['remaining_credit'];
    if (json['bios'] != null) {
      bios = <Bios>[];
      json['bios'].forEach((v) {
        bios!.add(Bios.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['remaining_credit'] = remainingCredit;
    if (bios != null) {
      data['bios'] = bios!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bios {
  int? id;
  int? bioId;
  String? bio;

  Bios({this.id, this.bioId, this.bio});

  Bios.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bioId = json['bio id'];
    bio = json['bio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['bio id'] = bioId;
    data['bio'] = bio;
    return data;
  }
}
