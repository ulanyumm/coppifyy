import 'package:flutter/material.dart';
import 'package:hypotenuse/service/instagram_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/instagram_post_model.dart';

class InstagramViewModel extends ChangeNotifier {
  InstagramService service = InstagramService();
  TextEditingController instagramProduct = TextEditingController();
  TextEditingController instagramAudience = TextEditingController();
  TextEditingController instagramBrand = TextEditingController();
  TextEditingController instagramKeywordsController = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey instagramPostFormkey = GlobalKey();
  List<String> instagramKeywordsList = [];

  bool isDataAvailable = false;

  String selectedTone = "Conversational";
  Map<String, String> instagramToneMap = {
    "Conversational": '1',
    "Enthusiatic": '2',
    "Humorous": '3',
    "Professional": '4',
  };

  void addItem(String item, BuildContext context) {
    if (item.isNotEmpty) {
      instagramKeywordsList.add(item);
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error")));
    }
  }

  void removeItem(String item) {
    instagramKeywordsList.remove(item);
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

  void updateCharacterCount(String content) {
    _characterCount = content.length;
    notifyListeners();
  }

  bool selectedAnything = false;
  bool selectedDrafts = false;

  Future instaPost({
    required String product,
    required String keywords,
    required String toneId,
    String? audience,
    String? brand,
  }) async {
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
      notifyListeners();
    } else {
      // Error
    }
  }
}
