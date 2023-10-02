import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/templates/general/RewriteContent/rewrite_model.dart';
import 'package:hypotenuse/screen/templates/general/RewriteContent/rewrite_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RewriteContentViewModel extends ChangeNotifier {
  RewriteService service = RewriteService();
  TextEditingController rewriteContent = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey key = GlobalKey();
  bool isLoading = false;
  bool selectedRewrite = false;
  bool isDataAvailable = false;
  String funcName = "";
  bool isButtonActive = false;
  List<String> veriler = [
    "Improve",
    "Simplify",
    "Shorten",
    "Expand",
    "Rephrase"
  ];
  int selectedButtonIndex = -1;
  bool isChecked = false;
  String selectedToneId = "1";
  String selectedTone = "Conversational";
  Map<String, String> rewriteToneMap = {
    "Conversational": '1',
    "Enthusiatic": '2',
    "Humorous": '3',
    "Professional": '4',
  };
  void DisposeAll() {
    rewriteContent.dispose();
  }

  void rewriteTone(String tone) {
    selectedTone = tone;
    selectedToneId = rewriteToneMap[tone] ?? '1';
    notifyListeners();
  }

  void isButtonActiveFunc(String text) {
    isButtonActive = rewriteContent.text != "";
    notifyListeners();
  }

  void rewriteButton(int value) {
    selectedButtonIndex = value;
    funcName = veriler[value];
    isChecked = true;
    notifyListeners();
  }

  void removeWidgetIndex(int index) {
    if (index >= 0 && index < totalList.length) {
      totalList.removeAt(index);
      notifyListeners();
    }
  }

  RewriteModel rewriteModel = RewriteModel();
  List<RewriteModel> listDataModel = [];
  List<String> totalList = [];
  Future postTransactions({
    required String function,
    required String content,
    required String toneId,
  }) async {
    isLoading = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;

    Map<String, dynamic> requestBody = {
      "function": funcName,
      "content": content,
      "tone_id": toneId,
    };

    final response = await service.rewritePost(token, requestBody);

    if (response.result!) {
      // Başarılı senaryo
      // rewriteModel = response;
      for (var element in response.data!.rewritings!) {
        totalList.addAll(element.rewriting.toString().split(","));
      }
      listDataModel.add(response);
      isDataAvailable = true;
      isLoading = false;
      notifyListeners();
    } else {
      // Hata senaryosu
      isLoading = false;
      notifyListeners();
    }
  }
}
