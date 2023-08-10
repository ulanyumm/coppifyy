import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EcommerceProductViewModel extends ChangeNotifier {
  TextEditingController ecommerceProduct = TextEditingController();
  TextEditingController productDescription = TextEditingController();
  TextEditingController targetAudience = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey ecommerceFormKey = GlobalKey();
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;
  bool selectedDrafts = false;
  String selectedToneId = "1";
  String selectedTone = "Conversational";
  Map<String, String> ecommerceToneMap = {
    "Conversational": '1',
    "Enthusiatic": '2',
    "Humorous": '3',
    "Professional": '4',
  };

  void ecommerceTone(String tone) {
    selectedTone = tone;
    selectedToneId = ecommerceToneMap[tone] ?? '1';
    notifyListeners();
  }

  void animateContainer(BuildContext context) {
    selectedDrafts = !selectedDrafts;
    notifyListeners();
  }
}
