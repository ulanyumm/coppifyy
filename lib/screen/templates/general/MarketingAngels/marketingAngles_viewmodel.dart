import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/templates/general/MarketingAngels/marketing_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'marketing_service.dart';

class MarketingAnglesViewModel extends ChangeNotifier {
  CopifyserviceMarketing service = CopifyserviceMarketing();
  TextEditingController productService = TextEditingController();
  TextEditingController companyName = TextEditingController();
  bool isButtonActive = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  bool selectedDrafts = false;
  GlobalKey key = GlobalKey();
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;
  List<Data> dataList = [];
  MarketingModel marketingpostModel = MarketingModel();
  String selectedToneId = "1";
  String selectedTone = "Conversational";
  Map<String, String> marketingAnglesToneMap = {
    "Conversational": '1',
    "Enthusiatic": '2',
    "Humorous": '3',
    "Professional": '4',
  };
  void DisposeAll() {
    productService.dispose();
    companyName.dispose();
  }

  void marketingAnglesTone(String tone) {
    selectedTone = tone;
    selectedToneId = marketingAnglesToneMap[tone] ?? '1';
    notifyListeners();
  }

  void isButtonActiveFunc(String text, String text2) {
    isButtonActive = productService.text != "" && companyName.text != "";
    notifyListeners();
  }

  void removeWidgetIndex(int index) {
    if (index >= 0 && index < totalAds.length) {
      totalAds.removeAt(index);
      notifyListeners();
    }
  }

  void removeWidget(int item) {
    dataList.remove(item);
    notifyListeners();
  }

  List<MarketingModel> listDataModel = [];
  List<String> totalAds = [];
  Future postTransactions({
    required String product,
    required String companyName,
    required String toneId,
  }) async {
    isLoading = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;

    Map<String, dynamic> requestBody = {
      "product": product,
      "company_name": companyName,
      "tone_id": toneId,
    };

    final response = await service.postservice(token, requestBody);

    if (response.result!) {
      // Başarılı senaryo
      //marketingpostModel = response;

      // Eğer sürekli 3 item geliyosa
      // angles.addAll(response.data!.angles!);

      // Eğer api toplayıp veriyosa
      //  angles = response.data!.angles!;
      for (var element in response.data!.angles!) {
        totalAds.add(element.marketingAngle!);
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
