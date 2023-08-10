import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UIHelper {
  UIHelper._();

  static TextStyle getAnaBaslikTextStyle() {
    return TextStyle(
        color: Colors.black87, fontWeight: FontWeight.bold, fontSize: (17));
  }

  static TextStyle getBaslikTextStyle() {
    return TextStyle(
        color: Colors.black54, fontWeight: FontWeight.bold, fontSize: (14));
  }

  static TextStyle getIcerikTextStyle() {
    return TextStyle(color: Colors.black54, fontSize: (13));
  }

  static TextStyle getButtonTextStyle() {
    return TextStyle(color: Colors.white, fontSize: (13));
  }

  static TextStyle getButtonWhiteTextStyle() {
    return TextStyle(color: Colors.white, fontSize: (10));
  }

  static EdgeInsets getDefaultPadding() {
    return EdgeInsets.all(20);
  }

  static SizedBox altUstBosluk() {
    return SizedBox(height: 20);
  }

  static SizedBox kisaAraBosluk() {
    return SizedBox(height: 10);
  }

  static SizedBox uzunAraBosluk() {
    return SizedBox(height: 20);
  }

  static double buttonYukseklik() {
    return 30;
  }

  static double contentYukseklik() {
    return 300;
  }

  static Color passiveButtonColor() {
    return Color.fromARGB(255, 151, 177, 232);
  }

  static Color activeButtonColor() {
    return Color(0xFF3162D5);
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
    return Color.fromARGB(255, 255, 255, 255);
  }
}
