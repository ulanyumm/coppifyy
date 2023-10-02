class ContestPostModel {
  bool? result;
  Data? data;
  String? aim;
  String? way;
  String? prize;
  String? toneId;
  String? audience;

  ContestPostModel({
    this.result,
    this.data,
    this.aim,
    this.way,
    this.prize,
    this.toneId,
    this.audience,
  });

  ContestPostModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['aim'] = aim;
    data['way'] = way;
    data['prize'] = prize;
    data['tone_id'] = toneId;
    data['audience'] = audience;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? remainingCredit;
  List<Promotions>? promotions;

  Data({this.remainingCredit, this.promotions});

  Data.fromJson(Map<String, dynamic> json) {
    remainingCredit = json['remaining_credit'];
    if (json['promotions'] != null) {
      promotions = <Promotions>[];
      json['promotions'].forEach((v) {
        promotions!.add(Promotions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['remaining_credit'] = remainingCredit;
    if (promotions != null) {
      data['promotions'] = promotions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Promotions {
  int? id;
  int? contestId;
  String? contest;

  Promotions({this.id, this.contestId, this.contest});

  Promotions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contestId = json['contest_id'];
    contest = json['contest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['contest_id'] = contestId;
    data['contest'] = contest;
    return data;
  }
}
