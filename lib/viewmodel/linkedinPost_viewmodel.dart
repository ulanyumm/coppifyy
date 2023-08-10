import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LinkedinPostsViewModel extends ChangeNotifier {
  TextEditingController postAboutController = TextEditingController();
  TextEditingController additionalContextController = TextEditingController();
  TextEditingController targetAudienceController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  bool selectedDrafts = false;
  bool isGenerateAvailable = false;
  bool isCaptionChanged = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey formKey = GlobalKey();
  List<String> linkedinPostsKeywordsList = [];
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;
  String selectedToneId = "1";
  String selectedTone = "Conversational";
  Map<String, String> linkedinAdsToneMap = {
    "Conversational": '1',
    "Enthusiatic": '2',
    "Humorous": '3',
    "Professional": '4',
  };

  void linkedinAdsTone(String tone) {
    selectedTone = tone;
    selectedToneId = linkedinAdsToneMap[tone] ?? '1';
    notifyListeners();
  }

  void addItemToList(String etiket, BuildContext context) {
    linkedinPostsKeywordsList.add(etiket);
    notifyListeners();
  }

  void removeInterest(String etiket) {
    linkedinPostsKeywordsList.remove(etiket);
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
