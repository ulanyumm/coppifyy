import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MarketingAnglesViewModel extends ChangeNotifier {
  TextEditingController productService = TextEditingController();
  TextEditingController companyName = TextEditingController();

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  bool selectedDrafts = false;
  GlobalKey key = GlobalKey();
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;
  String selectedToneId = "1";
  String selectedTone = "Conversational";
  Map<String, String> marketingAnglesToneMap = {
    "Conversational": '1',
    "Enthusiatic": '2',
    "Humorous": '3',
    "Professional": '4',
  };

  void marketingAnglesTone(String tone) {
    selectedTone = tone;
    selectedToneId = marketingAnglesToneMap[tone] ?? '1';
    notifyListeners();
  }
}
