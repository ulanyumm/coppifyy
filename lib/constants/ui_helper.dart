import 'package:flutter/material.dart';

class UIHelper {
  UIHelper._();

  static TextStyle getAnaBaslikTextStyle() {
    return const TextStyle(
        color: Colors.black87, fontWeight: FontWeight.bold, fontSize: (17));
  }

  static TextStyle getBaslikTextStyle() {
    return const TextStyle(
        color: Colors.black54, fontWeight: FontWeight.bold, fontSize: (14));
  }

  static TextStyle getIcerikTextStyle() {
    return const TextStyle(color: Colors.black54, fontSize: (13));
  }

  static TextStyle getButtonTextStyle() {
    return const TextStyle(color: Colors.white, fontSize: (13));
  }

  static TextStyle getButtonWhiteTextStyle() {
    return const TextStyle(color: Colors.white, fontSize: (10));
  }

  static EdgeInsets getDefaultPadding() {
    return const EdgeInsets.all(20);
  }

  static SizedBox altUstBosluk() {
    return const SizedBox(height: 20);
  }

  static SizedBox kisaAraBosluk() {
    return const SizedBox(height: 10);
  }

  static SizedBox uzunAraBosluk() {
    return const SizedBox(height: 20);
  }

  static double buttonYukseklik() {
    return 30;
  }

  static double contentYukseklik() {
    return 300;
  }

  static Color passiveButtonColor() {
    return const Color.fromARGB(255, 151, 177, 232);
  }

  static Color activeButtonColor() {
    return const Color(0xFF3162D5);
  }

  static double dropdownYukseklik() {
    return 35;
  }

  static double keywordsYukseklik() {
    return 40;
  }

  static double textfieldYukseklik() {
    return 55;
  }

  static Color fillColor() {
    return const Color.fromARGB(255, 255, 255, 255);
  }
}
