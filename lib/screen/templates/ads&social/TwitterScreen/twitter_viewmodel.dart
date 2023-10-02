import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/templates/ads&social/TwitterScreen/twitterPost_model.dart';
import 'package:hypotenuse/screen/templates/ads&social/TwitterScreen/twitterPost_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TwitterPostviewModel extends ChangeNotifier {
  CopifyServiceTwitterPost service = CopifyServiceTwitterPost();
  TextEditingController twitterPost = TextEditingController();
  bool isGenerateAvailable = false;
  bool isCaptionChanged = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey twitterPostFormkey = GlobalKey();
  bool isSelect = false;
  bool isChecked = false;
  int selectedButtonIndex = 0;
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;
  String selectedToneId = "1";
  String selectedTone = "Conversational";
  Map<String, String> twitterToneMap = {
    "Conversational": '1',
    "Enthusiatic": '2',
    "Humorous": '3',
    "Professional": '4',
  };
  String funcName = "Tweet";
  List<String> veriler = [
    "Tweet",
    "Thread",
  ];
  void DisposeAll() {
    twitterPost.dispose();
  }

  void twitterButton(int value) {
    selectedButtonIndex = value;
    funcName = veriler[value];
    isChecked = true;
    notifyListeners();
  }

  void instaTone(String tone) {
    selectedTone = tone;
    selectedToneId = twitterToneMap[tone] ?? '1';
    notifyListeners();
  }

  void removeWidgetIndex(int index) {
    if (index >= 0 && index < totalList.length) {
      totalList.removeAt(index);
      notifyListeners();
    }
  }

  TwitterPostModel dataModel = TwitterPostModel();

  bool isActiveButton = false;
  checkActiveButton() {
    if (twitterPost.text.isNotEmpty) {
      isActiveButton = true;
      print("active ");
    } else {
      print("passive ");
      isActiveButton = false;
    }
    notifyListeners();
  }

  checkAvailable(bool available) {
    isGenerateAvailable = available;
    notifyListeners();
  }

  List<TwitterPostModel> listDataModel = [];
  List<String> totalList = [];
  Future postTransactions(
    BuildContext context, {
    required String function,
    required String about,
    required String toneId,
  }) async {
    isLoading = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    print(funcName);
    final response = await service.postservice(
      token,
      {
        "function": function,
        "about": about,
        "tone_id": toneId,
      },
    );

    if (response.result!) {
      // Work
      // dataModel = response;

      for (var element in response.data!.descriptions!) {
        totalList.add(element.description!);
      }
      listDataModel.add(response);
      isDataAvailable = true;
      isLoading = false;
      notifyListeners();
    } else {
      isLoading = true;
      // Error
    }
  }
}
