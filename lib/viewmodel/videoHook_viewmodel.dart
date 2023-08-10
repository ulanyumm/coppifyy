import 'package:flutter/material.dart';
import 'package:hypotenuse/service/instagram_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/instagram_post_model.dart';

class VideoHookViewModel extends ChangeNotifier {
  InstagramService service = InstagramService();
  TextEditingController videoTopicController = TextEditingController();
  TextEditingController videoHookAudience = TextEditingController();
  TextEditingController videoHookDetailBrand = TextEditingController();
  TextEditingController videoHookKeywordsController = TextEditingController();
  TextEditingController captionsEditController = TextEditingController();
  bool selectedDrafts = false;
  bool isGenerateAvailable = false;
  bool isCaptionChanged = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey videoHookPostFormkey = GlobalKey();
  List<String> videoHookKeywordsList = [];
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;
  String selectedToneId = "1";
  String selectedTone = "Conversational";
  Map<String, String> videoHookToneMap = {
    "Conversational": '1',
    "Enthusiatic": '2',
    "Humorous": '3',
    "Professional": '4',
  };

  void videoHookTone(String tone) {
    selectedTone = tone;
    selectedToneId = videoHookToneMap[tone] ?? '1';
    notifyListeners();
  }

  void addItemToList(String etiket, BuildContext context) {
    videoHookKeywordsList.add(etiket);
    notifyListeners();
  }

  void removeInterest(String etiket) {
    videoHookKeywordsList.remove(etiket);
    notifyListeners();
  }

  void animateContainer(BuildContext context) {
    selectedDrafts = !selectedDrafts;
    notifyListeners();
  }

  String _text = '';
  String get text => _text;

  void updateText(String newText) {
    _text = newText;
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
