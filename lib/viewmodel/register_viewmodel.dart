// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/auth/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screen/dashboardScreen.dart';

class RegisterViewModel {
  AuthService service = AuthService();
  String? validateEmail(value) {
    if (value!.isEmpty) {
      return 'Please enter some text';
    }
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? lengthPassword(value) {
    if (value!.isEmpty) {
      return 'Şifre Alanı Boş Kalamaz';
    }
    if (value.length < 8) {
      return 'Şifre En Az 8 Karakter Olmalı';
    }
    return null;
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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
          .showSnackBar(const SnackBar(content: Text("Hata Mesajı")));
    }
  }

  // Token'i SharedPreferences'e kaydeden fonksiyon
  Future<void> saveTokenToSharedPreferences(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
  }
}
