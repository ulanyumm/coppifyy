class AskAnyThingPostModel {
  bool? result;
  Data? data;
  String? input;
  String? context;
  String? toneId;

  AskAnyThingPostModel({
    this.result,
    this.data,
    this.input,
    this.context,
    this.toneId,
  });

  AskAnyThingPostModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['input'] = this.input;
    data['context'] = this.context;
    data['tone_id'] = this.toneId;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? remainingCredit;
  Answer? answer;

  Data({this.remainingCredit, this.answer});

  Data.fromJson(Map<String, dynamic> json) {
    remainingCredit = json['remaining_credit'];
    answer =
        json['answer'] != null ? new Answer.fromJson(json['answer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['remaining_credit'] = this.remainingCredit;
    if (this.answer != null) {
      data['answer'] = this.answer!.toJson();
    }
    return data;
  }
}

class Answer {
  int? id;
  int? askId;
  String? answer;

  Answer({this.id, this.askId, this.answer});

  Answer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    askId = json['ask id'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ask id'] = this.askId;
    data['answer'] = this.answer;
    return data;
  }
}
