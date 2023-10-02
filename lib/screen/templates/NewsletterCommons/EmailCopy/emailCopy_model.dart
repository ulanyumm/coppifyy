class EmailCopyModel {
  bool? result;
  Data? data;
  String? purpose;
  String? keywords;
  String? toneId;
  String? audience;
  String? brand;

  EmailCopyModel({this.result, this.data});

  EmailCopyModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    purpose = json['purpose'];
    keywords = json['keywords'];
    toneId = json['tone_id'];
    audience = json['audience'];

    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? remainingCredit;
  List<Mail>? mail;

  Data({this.remainingCredit, this.mail});

  Data.fromJson(Map<String, dynamic> json) {
    remainingCredit = json['remaining_credit'];
    if (json['mail'] != null) {
      mail = <Mail>[];
      json['mail'].forEach((v) {
        mail!.add(Mail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['remaining_credit'] = remainingCredit;
    if (mail != null) {
      data['mail'] = mail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Mail {
  int? id;
  int? mailId;
  Mail2? mail;

  Mail({this.id, this.mailId, this.mail});

  Mail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mailId = json['mail id'];
    mail = json['mail'] != null ? Mail2.fromJson(json['mail']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['mail id'] = mailId;
    if (mail != null) {
      data['mail'] = mail!.toJson();
    }
    return data;
  }
}

class Mail2 {
  String? subject;
  String? email;

  Mail2({this.subject, this.email});

  Mail2.fromJson(Map<String, dynamic> json) {
    subject = json['subject'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subject'] = subject;
    data['email'] = email;
    return data;
  }
}
