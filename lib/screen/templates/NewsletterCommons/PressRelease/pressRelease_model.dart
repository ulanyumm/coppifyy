class PressReleaseModel {
  bool? result;
  Data? data;
  String? companyDescription;
  String? companyName;
  String? announcement;

  PressReleaseModel({
    this.result,
    this.data,
    this.companyDescription,
    this.companyName,
    this.announcement,
  });

  PressReleaseModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['company_description'] = companyDescription;
    data['company_name'] = companyName;
    data['announcement'] = announcement;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? remainingCredit;
  List<Pressreleases>? pressreleases;

  Data({this.remainingCredit, this.pressreleases});

  Data.fromJson(Map<String, dynamic> json) {
    remainingCredit = json['remaining_credit'];
    if (json['pressreleases'] != null) {
      pressreleases = <Pressreleases>[];
      json['pressreleases'].forEach((v) {
        pressreleases!.add(Pressreleases.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['remaining_credit'] = remainingCredit;
    if (pressreleases != null) {
      data['pressreleases'] =
          pressreleases!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pressreleases {
  int? id;
  int? pressreleaseId;
  String? pressrelease;

  Pressreleases({this.id, this.pressreleaseId, this.pressrelease});

  Pressreleases.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pressreleaseId = json['pressrelease_id'];
    pressrelease = json['pressrelease'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['pressrelease_id'] = pressreleaseId;
    data['pressrelease'] = pressrelease;
    return data;
  }
}
