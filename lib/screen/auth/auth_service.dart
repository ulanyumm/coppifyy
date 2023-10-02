import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';
import 'package:hypotenuse/model/forgotPassword_model.dart';
import 'package:hypotenuse/model/login_model.dart';
import 'package:hypotenuse/model/register_model.dart';
import 'package:hypotenuse/model/showAuth_model.dart';

import 'verificationModel.dart';

class AuthService {
  Future<RegisterModel> register(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse(registerUrl),
      body: data,
      headers: {"Accept": "application/json"},
    );

    return RegisterModel.fromJson(jsonDecode(response.body));
  }

  Future<LoginModel> login(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse(loginUrl),
      body: data,
      headers: {"Accept": "application/json"},
    );

    return LoginModel.fromJson(jsonDecode(response.body));
  }

  Future<ForgotPasswordModel> forgotPassword(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse(resetMailUrl),
      body: data,
      headers: {"Accept": "application/json"},
    );

    return ForgotPasswordModel.fromJson(jsonDecode(response.body));
  }

  Future<ShowAuthModel> showUser(String token) async {
    final response = await http.get(
      Uri.parse(showUserUrl),
      headers: {
        "Authorization": "Bearer $token",
        "Accept": "application/json",
      },
    );

    return ShowAuthModel.fromJson(jsonDecode(response.body));
  }

  Future<VerificationModel> verificationMail(String token) async {
    final response = await http.get(
      Uri.parse(verifyUrl),
      headers: {
        "Authorization": "Bearer $token",
        "Accept": "application/json",
      },
    );

    return VerificationModel.fromJson(jsonDecode(response.body));
  }
}
