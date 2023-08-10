import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ValuePropositionViewModel extends ChangeNotifier {
  TextEditingController product = TextEditingController();
  TextEditingController companyproductDescription = TextEditingController();
  TextEditingController targetAudience = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey formkey = GlobalKey();
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;
  bool selectedDrafts = false;

  String selectedToneId = "1";
  String selectedTone = "Conversational";
  Map<String, String> valuePropositionToneMap = {
    "Conversational": '1',
    "Enthusiatic": '2',
    "Humorous": '3',
    "Professional": '4',
  };

  void valuePropositionTone(String tone) {
    selectedTone = tone;
    selectedToneId = valuePropositionToneMap[tone] ?? '1';
    notifyListeners();
  }

  void animateContainer(BuildContext context) {
    selectedDrafts = !selectedDrafts;
    notifyListeners();
  }
}
