class JobAdvertisementModel {
  bool? result;
  Data? data;
  String? job;
  String? info;
  String? looking;
  String? toneId;
  String? companyName;

  JobAdvertisementModel({
    this.result,
    this.data,
    this.job,
    this.info,
    this.looking,
    this.toneId,
    this.companyName,
  });

  JobAdvertisementModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['job'] = job;
    data['info'] = info;
    data['looking'] = looking;
    data['tone_id'] = toneId;
    data['company_name'] = companyName;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? remainingCredit;
  List<Descriptions>? descriptions;

  Data({this.remainingCredit, this.descriptions});

  Data.fromJson(Map<String, dynamic> json) {
    remainingCredit = json['remaining_credit'];
    if (json['descriptions'] != null) {
      descriptions = <Descriptions>[];
      json['descriptions'].forEach((v) {
        descriptions!.add(Descriptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['remaining_credit'] = remainingCredit;
    if (descriptions != null) {
      data['descriptions'] = descriptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Descriptions {
  int? id;
  int? jobId;
  String? description;

  Descriptions({this.id, this.jobId, this.description});

  Descriptions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobId = json['job_id'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['job_id'] = jobId;
    data['description'] = description;
    return data;
  }
}
