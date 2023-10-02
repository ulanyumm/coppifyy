class SummarizeContentModel {
  bool? result;
  Data? data;
  String? text;
  String? type;
  SummarizeContentModel({
    this.result,
    this.data,
    this.text,
    this.type,
  });

  SummarizeContentModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['text'] = text;
    data['type'] = type;

    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? remainingCredit;
  Summaries? summaries;

  Data({this.remainingCredit, this.summaries});

  Data.fromJson(Map<String, dynamic> json) {
    remainingCredit = json['remaining_credit'];
    summaries = json['summaries'] != null
        ? Summaries.fromJson(json['summaries'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['remaining_credit'] = remainingCredit;
    if (summaries != null) {
      data['summaries'] = summaries!.toJson();
    }
    return data;
  }
}

class Summaries {
  int? id;
  int? summarizeProjectId;
  String? summary;

  Summaries({this.id, this.summarizeProjectId, this.summary});

  Summaries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    summarizeProjectId = json['summarize_project_id'];
    summary = json['summary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['summarize_project_id'] = summarizeProjectId;
    data['summary'] = summary;
    return data;
  }
}
