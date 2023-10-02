import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';
import 'package:hypotenuse/screen/auth/Login/logInScreen.dart';
import 'package:hypotenuse/screen/auth/verificationModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  AuthService _service = AuthService();
  Future logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request('GET', Uri.parse(logoutUrl));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      await prefs.remove("token");
      print(await response.stream.bytesToString());
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LogInScreen()),
          (route) => false);
    } else {
      print(response.reasonPhrase);
    }
  }

  bool rememberMe = false;
  Future<void> loadRememberMeStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    rememberMe = prefs.getBool('rememberMe') ?? false;
    notifyListeners();
  }

  Future<void> saveRememberMeStatus(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    rememberMe = status;
    await prefs.setBool('rememberMe', rememberMe);
  }

  VerificationModel verificationModel = VerificationModel();

  Future verificationMailfunc() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;

    final response = await _service.verificationMail(token);

    if (response.result!) {
      verificationModel = response;
      notifyListeners();
    } else {}
  }
}
