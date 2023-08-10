import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RewriteContentViewModel extends ChangeNotifier {
  TextEditingController rewriteContent = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey key = GlobalKey();
  bool isLoading = false;
  bool selectedRewrite = false;
  bool isDataAvailable = false;
  int selectedButtonIndex = -1;
  bool isChecked = false;
  String selectedToneId = "1";
  String selectedTone = "Conversational";
  Map<String, String> rewriteToneMap = {
    "Conversational": '1',
    "Enthusiatic": '2',
    "Humorous": '3',
    "Professional": '4',
  };
  void rewriteTone(String tone) {
    selectedTone = tone;
    selectedToneId = rewriteToneMap[tone] ?? '1';
    notifyListeners();
  }

  void rewriteButton(int value) {
    selectedButtonIndex = value;
    isChecked = true;
    notifyListeners();
  }
}
