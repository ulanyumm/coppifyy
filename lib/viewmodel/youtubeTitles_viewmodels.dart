import 'package:flutter/material.dart';
import 'package:hypotenuse/service/instagram_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/instagram_post_model.dart';

class YoutubeTitlesViewModel extends ChangeNotifier {
  TextEditingController videoTopicController = TextEditingController();
  TextEditingController youtubeKeywordsController = TextEditingController();
  TextEditingController youtubeAudience = TextEditingController();
  TextEditingController youtubeBrand = TextEditingController();
  bool selectedDrafts = false;
  bool isGenerateAvailable = false;
  bool isCaptionChanged = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey formKey = GlobalKey();
  List<String> youtubeKeywordsList = [];
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;
  String selectedToneId = "1";
  String selectedTone = "Conversational";
  Map<String, String> youtubeToneMap = {
    "Conversational": '1',
    "Enthusiatic": '2',
    "Humorous": '3',
    "Professional": '4',
  };

  void youtubeTone(String tone) {
    selectedTone = tone;
    selectedToneId = youtubeToneMap[tone] ?? '1';
    notifyListeners();
  }

  void addItemToList(String etiket, BuildContext context) {
    youtubeKeywordsList.add(etiket);
    notifyListeners();
  }

  void removeInterest(String etiket) {
    youtubeKeywordsList.remove(etiket);
    notifyListeners();
  }

  void animateContainer(BuildContext context) {
    selectedDrafts = !selectedDrafts;
    notifyListeners();
  }

  int _characterCount = 0;
  int get characterCount => _characterCount;
  void updateCharacterCount(String icerik) {
    _characterCount = icerik.length;
    () => notifyListeners();
  }

  checkAvailable(bool available) {
    isGenerateAvailable = available;
    notifyListeners();
  }
}
