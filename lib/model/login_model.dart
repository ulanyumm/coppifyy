class LoginModel {
  bool? result;
  String? message;
  String? email;
  String? password;
  Data? data;

  LoginModel({
    this.result,
    this.message,
    this.email,
    this.password,
    this.data,
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['message'] = message;
    data['email'] = email;
    data['password'] = password;
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
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'] != null ? Token.fromJson(json['token']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (token != null) {
      data['token'] = token!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['picture'] = picture;
    data['emailVerified'] = emailVerified;
    data['inputLanguageId'] = inputLanguageId;
    data['outputLanguageId'] = outputLanguageId;
    data['credit'] = credit;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['expires_in'] = expiresIn;
    return data;
  }
}
