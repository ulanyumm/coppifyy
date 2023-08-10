import 'package:flutter/material.dart';
import 'package:hypotenuse/service/askAnyThing_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/askAnything_model.dart';

class AskAnyThingViewModel extends ChangeNotifier {
  TextEditingController instructionQuestion = TextEditingController();
  TextEditingController additionalContext = TextEditingController();
  AskAnythingService service = AskAnythingService();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey formKey = GlobalKey();
  List<String> additionalKeywordsList = [];
  bool isLoading = false;
  bool isDataLoaded = false;
  bool selectedDrafts = false;
  bool isDataAvailable = false;
  String selectedToneId = "1";
  String selectedTone = "Conversational";
  Map<String, String> askAnythingToneMap = {
    "Conversational": '1',
    "Enthusiatic": '2',
    "Humorous": '3',
    "Professional": '4',
  };

  bool isGenerateAvailable = false;
  checkAvailable(bool available) {
    isGenerateAvailable = available;
    notifyListeners();
  }

  void askAnyTone(String tone) {
    selectedTone = tone;
    selectedToneId = askAnythingToneMap[tone] ?? '1';
    notifyListeners();
  }

  void addItemToList(String etiket, BuildContext context) {
    additionalKeywordsList.add(etiket);
    notifyListeners();
  }

  void removeInterest(String etiket) {
    additionalKeywordsList.remove(etiket);
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

  AskAnyThingPostModel askAnyModel = AskAnyThingPostModel();

  Future askAnyPost({
    required String input,
    required String context,
    required String toneId,
  }) async {
    isLoading = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;

    Map<String, dynamic> requestBody = {
      "input": input,
      "context": context, // "context" alanını doldurun
      "tone_id": toneId,
    };

    final response = await service.askAnyPost(token, requestBody);

    if (response.result!) {
      // Başarılı senaryo
      askAnyModel = response;
      isDataAvailable = true;
    } else {
      // Hata senaryosu
    }
  }
}
