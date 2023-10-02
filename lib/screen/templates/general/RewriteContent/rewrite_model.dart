class RewriteModel {
  bool? result;
  Data? data;
  String? function;
  String? toneId;
  String? content;

  RewriteModel({
    this.result,
    this.data,
    this.function,
    this.toneId,
    this.content,
  });

  RewriteModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['function'] = function;
    data['tone_id'] = toneId;
    data['content'] = content;

    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? remainingCredit;
  List<Rewritings>? rewritings;

  Data({this.remainingCredit, this.rewritings});

  Data.fromJson(Map<String, dynamic> json) {
    remainingCredit = json['remaining_credit'];
    if (json['rewritings'] != null) {
      rewritings = <Rewritings>[];
      json['rewritings'].forEach((v) {
        rewritings!.add(Rewritings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['remaining_credit'] = remainingCredit;
    if (rewritings != null) {
      data['rewritings'] = rewritings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rewritings {
  int? id;
  int? rewriteProjectId;
  String? rewriting;

  Rewritings({this.id, this.rewriteProjectId, this.rewriting});

  Rewritings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rewriteProjectId = json['rewrite_project_id'];
    rewriting = json['rewriting'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rewrite_project_id'] = rewriteProjectId;
    data['rewriting'] = rewriting;
    return data;
  }
}
