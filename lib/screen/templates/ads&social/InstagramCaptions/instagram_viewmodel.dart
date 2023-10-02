import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/templates/ads&social/InstagramCaptions/instagram_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'instagram_post_model.dart';

class InstagramViewModel extends ChangeNotifier {
  InstagramService service = InstagramService();
  TextEditingController instagramProduct = TextEditingController();
  TextEditingController instagramAudience = TextEditingController();
  TextEditingController instagramBrand = TextEditingController();
  TextEditingController instagramKeywordsController = TextEditingController();
  TextEditingController captionsEditController = TextEditingController();
  bool selectedDrafts = false;
  bool isGenerateAvailable = false;
  bool isCaptionChanged = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey instagramPostFormkey = GlobalKey();
  List<String> instagramKeywordsList = [];
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;
  String selectedToneId = "1";
  String selectedTone = "Conversational";
  Map<String, String> instagramToneMap = {
    "Conversational": '1',
    "Enthusiatic": '2',
    "Humorous": '3',
    "Professional": '4',
  };
  void DisposeAll() {
    instagramProduct.dispose();
    instagramAudience.dispose();
    instagramBrand.dispose();
    instagramKeywordsController.dispose();
  }

  void instaTone(String tone) {
    selectedTone = tone;
    selectedToneId = instagramToneMap[tone] ?? '1';
    notifyListeners();
  }

  void addItemToList(String etiket, BuildContext context) {
    instagramKeywordsList.add(etiket);
    notifyListeners();
  }

  void removeInterest(String etiket) {
    instagramKeywordsList.remove(etiket);
    notifyListeners();
  }

  void animateContainer(BuildContext context) {
    selectedDrafts = !selectedDrafts;
    notifyListeners();
  }

  InstagramPostModel instaModel = InstagramPostModel();
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

  Future instaPost({
    required String product,
    required String keywords,
    required String toneId,
    String? audience,
    String? brand,
  }) async {
    isLoading = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    final response = await service.instaPost(
      token,
      {
        "product": product,
        "keywords": keywords,
        "tone_id": toneId,
        "audience": audience ?? "",
        "brand": brand ?? "",
      },
    );

    if (response.result!) {
      // Work
      instaModel = response;
      isDataAvailable = true;
      isLoading = false;
      notifyListeners();
    } else {
      isLoading = true;
      // Error
    }
  }
}
