import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';
import 'package:hypotenuse/model/login_model.dart';
import 'package:hypotenuse/model/register_model.dart';

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
}
