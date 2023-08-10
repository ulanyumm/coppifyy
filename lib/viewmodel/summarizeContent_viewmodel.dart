import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SummarizeContentViewModel extends ChangeNotifier {
  TextEditingController summarizeContent = TextEditingController();
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey key = GlobalKey();
  String selectedToneId = "1";
  String selectedTone = "Paragraph";
  Map<String, String> summarizeToneMap = {
    "Paragraph": '1',
    "Bullet Points": '2',
  };

  void summarizeTone(String tone) {
    selectedTone = tone;
    selectedToneId = summarizeToneMap[tone] ?? '1';
    notifyListeners();
  }
}
