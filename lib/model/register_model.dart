class RegisterModel {
  bool? result;
  Data? data;
  String? email;
  String? password;
  String? firstName;
  String? lastName;

  RegisterModel({
    this.result,
    this.data,
    this.email,
    this.password,
    this.firstName,
    this.lastName,
  });

  RegisterModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    email = json['email'];
    password = json['password'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;
  Token? token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'] != null ? new Token.fromJson(json['token']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.token != null) {
      data['token'] = this.token!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? email;
  String? firstName;
  String? lastName;
  String? picture;
  bool? emailVerified;
  int? inputLanguageId;
  int? outputLanguageId;
  int? credit;

  User(
      {this.id,
      this.email,
      this.firstName,
      this.lastName,
      this.picture,
      this.emailVerified,
      this.inputLanguageId,
      this.outputLanguageId,
      this.credit});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    picture = json['picture'];
    emailVerified = json['emailVerified'];
    inputLanguageId = json['inputLanguageId'];
    outputLanguageId = json['outputLanguageId'];
    credit = json['credit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['picture'] = this.picture;
    data['emailVerified'] = this.emailVerified;
    data['inputLanguageId'] = this.inputLanguageId;
    data['outputLanguageId'] = this.outputLanguageId;
    data['credit'] = this.credit;
    return data;
  }
}

class Token {
  String? code;
  int? expiresIn;

  Token({this.code, this.expiresIn});

  Token.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['expires_in'] = this.expiresIn;
    return data;
  }
}
