// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hypotenuse/service/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screen/dashboardScreen.dart';

class RegisterViewModel {
  AuthService service = AuthService();

  Future registerAuth(BuildContext context, String email, String password,
      String firstName, String lastName, String text) async {
    final response = await service.register({
      "email": email,
      "password": password,
      "confirmPassword": password,
      "firstName": firstName,
      "lastName": lastName
    });

    if (response.result!) {
      String tokenCode = response.data!.token!.code!;
      await saveTokenToSharedPreferences(tokenCode);
      // Kayıt olsun Naviagate to homeViw
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Hata Mesajı")));
    }
  }

  // Token'i SharedPreferences'e kaydeden fonksiyon
  Future<void> saveTokenToSharedPreferences(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
  }
}
