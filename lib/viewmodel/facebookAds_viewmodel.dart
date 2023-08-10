import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FacebookAdsViewModel extends ChangeNotifier {
  TextEditingController productController = TextEditingController();
  TextEditingController keywordsController = TextEditingController();
  TextEditingController targetAudienceController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  bool selectedDrafts = false;
  bool isGenerateAvailable = false;
  bool isCaptionChanged = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey formKey = GlobalKey();
  List<String> facebookAdsKeywordsList = [];
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;
  String selectedToneId = "1";
  String selectedTone = "Conversational";
  Map<String, String> facebookAdsToneMap = {
    "Conversational": '1',
    "Enthusiatic": '2',
    "Humorous": '3',
    "Professional": '4',
  };

  void facebookAdsTone(String tone) {
    selectedTone = tone;
    selectedToneId = facebookAdsToneMap[tone] ?? '1';
    notifyListeners();
  }

  void addItemToList(String etiket, BuildContext context) {
    facebookAdsKeywordsList.add(etiket);
    notifyListeners();
  }

  void removeInterest(String etiket) {
    facebookAdsKeywordsList.remove(etiket);
    notifyListeners();
  }

  void animateContainer(BuildContext context) {
    selectedDrafts = !selectedDrafts;
    notifyListeners();
  }

  checkAvailable(bool available) {
    isGenerateAvailable = available;
    notifyListeners();
  }
}
