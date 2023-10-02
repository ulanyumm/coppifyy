import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/templates/general/SummarizeContent/summarize_model.dart';
import 'package:hypotenuse/screen/templates/general/SummarizeContent/summarize_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SummarizeContentViewModel extends ChangeNotifier {
  SummarizeService service = SummarizeService();
  TextEditingController summarizeContent = TextEditingController();
  bool isButtonActive = false;
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;
  List<Widget> widgetList = [];
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  List<Data> dataList = [];
  GlobalKey key = GlobalKey();
  String selectedToneId = "1";
  String selectedTone = "Paragraph";
  Map<String, String> summarizeToneMap = {
    "Paragraph": '1',
    "Bullet Points": '2',
  };
  void DisposeAll() {
    summarizeContent.dispose();
  }

  void summarizeTone(String tone) {
    selectedTone = tone;
    selectedToneId = summarizeToneMap[tone] ?? '1';
    notifyListeners();
  }

  void isButtonActiveFunc(String text) {
    isButtonActive = summarizeContent.text != "";

    notifyListeners();
  }

  void updateSummarizeContent(String content) {
    summarizeContent.text = content;
    notifyListeners();
  }

  void removeWidget(Data item) {
    dataList.remove(item);
    notifyListeners();
  }

  SummarizeContentModel summarizeModel = SummarizeContentModel();

  Future summarizePost({
    required String context,
    required String toneId,
  }) async {
    isLoading = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;

    Map<String, dynamic> requestBody = {
      "text": context,
      "type": toneId,
    };

    final response = await service.summmarizePost(token, requestBody);

    if (response.result!) {
      // Başarılı senaryo
      summarizeModel = response;
      isDataAvailable = true;
      isLoading = false;
      notifyListeners();
      if (summarizeModel.data != null) {
        //Listenin liste olarak dayatılması
        dataList.add(summarizeModel.data!);
      }
    } else {
      // Hata senaryosu
      isLoading = false;
      notifyListeners();
    }
  }
}
