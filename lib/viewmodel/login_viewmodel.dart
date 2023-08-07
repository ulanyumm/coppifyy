// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hypotenuse/service/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screen/dashboardScreen.dart';

class LoginViewModel {
  AuthService service = AuthService();

  Future loginAuth(
    BuildContext context,
    String email,
    String password,
    String text,
  ) async {
    final response = await service.login({
      "email": email,
      "password": password,
    });

    print(response);

    if (response.result!) {
      String tokenCode = response.data!.token!.code!;
      await saveTokenToSharedPreferences(tokenCode);
      // Giriş yapsın Naviagate to homeViw
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Giriş Yapılamadı")));
    }
  }

  // Token'i SharedPreferences'e kaydeden fonksiyon
  Future<void> saveTokenToSharedPreferences(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
  }
}
