import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoogleAdsViewModel extends ChangeNotifier {
  TextEditingController postAboutController = TextEditingController();
  TextEditingController keywordsController = TextEditingController();
  TextEditingController targetAudienceController = TextEditingController();
  TextEditingController brandsController = TextEditingController();

  bool selectedDrafts = false;
  bool isGenerateAvailable = false;
  bool isCaptionChanged = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey formKey = GlobalKey();
  List<String> googleAdsKeywordsList = [];
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;
  String selectedToneId = "1";
  String selectedTone = "Conversational";
  Map<String, String> googleAdsToneMap = {
    "Conversational": '1',
    "Enthusiatic": '2',
    "Humorous": '3',
    "Professional": '4',
  };

  void googleAdsTone(String tone) {
    selectedTone = tone;
    selectedToneId = googleAdsToneMap[tone] ?? '1';
    notifyListeners();
  }

  void addItemToList(String etiket, BuildContext context) {
    googleAdsKeywordsList.add(etiket);
    notifyListeners();
  }

  void removeInterest(String etiket) {
    googleAdsKeywordsList.remove(etiket);
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
