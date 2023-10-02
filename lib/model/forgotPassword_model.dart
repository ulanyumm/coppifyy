class ForgotPasswordModel {
  bool? result;
  String? message;
  String? email;

  ForgotPasswordModel({
    this.result,
    this.message,
    this.email,
  });

  ForgotPasswordModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['message'] = message;
    data['email'] = email;

    return data;
  }
}
