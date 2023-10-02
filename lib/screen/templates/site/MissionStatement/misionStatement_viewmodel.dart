import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/templates/site/MissionStatement/misionState_model.dart';
import 'package:hypotenuse/screen/templates/site/MissionStatement/missionStatement_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MisionStatementViewModel extends ChangeNotifier {
  CopifyServiceMision service = CopifyServiceMision();
  TextEditingController misionCompanyNameController = TextEditingController();
  TextEditingController misionCompanyDescriptionController =
      TextEditingController();

  bool isGenerateAvailable = false;
  bool isCaptionChanged = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey misionCompanyFormkey = GlobalKey();
  bool isButtonActive = false;
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;
  String selectedToneId = "1";
  String selectedTone = "Conversational";
  Map<String, String> misionCompanyToneMap = {
    "Conversational": '1',
    "Enthusiatic": '2',
    "Humorous": '3',
    "Professional": '4',
  };

  void DisposeAll() {
    misionCompanyNameController.dispose();
    misionCompanyDescriptionController.dispose();
  }

  void misionCompanyTone(String tone) {
    selectedTone = tone;
    selectedToneId = misionCompanyToneMap[tone] ?? '1';
    notifyListeners();
  }

  void isButtonActiveFunc() {
    isButtonActive = misionCompanyNameController.value.text != "" &&
        misionCompanyDescriptionController.value.text != "";
    notifyListeners();
  }

  MisionStatementModel dataModel = MisionStatementModel();

  checkAvailable(bool available) {
    isGenerateAvailable = available;
    notifyListeners();
  }

  void removeWidgetIndex(int index) {
    if (index >= 0 && index < totalList.length) {
      totalList.removeAt(index);
      notifyListeners();
    }
  }

  List<MisionStatementModel> listDataModel = [];
  List<String> totalList = [];
  Future postTransactions({
    required String productName,
    required String productDescription,
    required String toneId,
  }) async {
    isLoading = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    final response = await service.postservice(
      token,
      {
        "product_name": productName,
        "product_description": productDescription,
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
