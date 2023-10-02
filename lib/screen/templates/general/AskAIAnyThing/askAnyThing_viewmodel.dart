import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/templates/general/AskAIAnyThing/askAnyThing_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'askAnything_model.dart';

class AskAnyThingViewModel extends ChangeNotifier {
  TextEditingController instructionQuestion = TextEditingController();
  TextEditingController additionalContext = TextEditingController();
  AskAnythingService service = AskAnythingService();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey formKey = GlobalKey();
  List<String> additionalKeywordsList = [];
  List<Data> dataList = [];
  bool isActiveButton = false;
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
  void DisposeAll() {
    instructionQuestion.dispose();
    additionalContext.dispose();
  }

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

  void isButtonActiveFunc(
      {required String instructionQuestion,
      required List<String> additionalContext}) {
    if (instructionQuestion.isNotEmpty && additionalKeywordsList.isNotEmpty) {
      isActiveButton = true;
      print("active ");
    } else {
      print("passive ");
      isActiveButton = false;
    }
    notifyListeners();
  }

  void addItemToList(String etiket, BuildContext context) {
    additionalKeywordsList.add(etiket);
    Provider.of<AskAnyThingViewModel>(context, listen: false)
        .isButtonActiveFunc(
      instructionQuestion: instructionQuestion.text,
      additionalContext: additionalKeywordsList,
    );
    notifyListeners();
  }

  void removeInterest(String etiket, BuildContext context) {
    additionalKeywordsList.remove(etiket);
    Provider.of<AskAnyThingViewModel>(context, listen: false)
        .isButtonActiveFunc(
      instructionQuestion: instructionQuestion.text,
      additionalContext: additionalKeywordsList,
    );
    notifyListeners();
  }

  void animateContainer(BuildContext context) {
    selectedDrafts = !selectedDrafts;
    notifyListeners();
  }

  void removeWidget(Data item) {
    dataList.remove(item);
    notifyListeners();
  }

  AskAnyThingPostModel askAnyModel = AskAnyThingPostModel();

  Future askAnyPost(
      {required String input,
      required String context,
      required String toneId,
      required BuildContext contextx}) async {
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
      isLoading = false;
      notifyListeners();
      if (askAnyModel.data != null) {
        //Listenin liste olarak dayatılması
        dataList.add(askAnyModel.data!);
      }
    } else {
      SnackBar snackBar = const SnackBar(
        content: Text("Hatanın içeriği"),
      );
      ScaffoldMessenger.of(contextx).showSnackBar(snackBar);
      // Hata senaryosu
      isLoading = false;
      notifyListeners();
    }
  }
}
