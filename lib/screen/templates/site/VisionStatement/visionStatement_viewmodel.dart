import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/templates/site/VisionStatement/visionStatement_model.dart';
import 'package:hypotenuse/screen/templates/site/VisionStatement/visionStatement_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VisionStatementViewModel extends ChangeNotifier {
  CopifyServiceVisionStatement service = CopifyServiceVisionStatement();
  TextEditingController visionCompanyNameController = TextEditingController();
  TextEditingController visionCompanyTargetAudiencecontroller =
      TextEditingController();
  TextEditingController visionCompanyDescriptionController =
      TextEditingController();
  bool selectedDrafts = false;
  bool isGenerateAvailable = false;
  bool isCaptionChanged = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey visionCompanyFormkey = GlobalKey();
  bool isButtonActive = false;
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;
  String selectedToneId = "1";
  String selectedTone = "Conversational";
  Map<String, String> visionCompanyToneMap = {
    "Conversational": '1',
    "Enthusiatic": '2',
    "Humorous": '3',
    "Professional": '4',
  };

  void DisposeAll() {
    visionCompanyNameController.dispose();
    visionCompanyTargetAudiencecontroller.dispose();
    visionCompanyDescriptionController.dispose();
  }

  void visionCompanyTone(String tone) {
    selectedTone = tone;
    selectedToneId = visionCompanyToneMap[tone] ?? '1';
    notifyListeners();
  }

  void animateContainer(BuildContext context) {
    selectedDrafts = !selectedDrafts;
    notifyListeners();
  }

  void isButtonActiveFunc() {
    isButtonActive = visionCompanyNameController.value.text != "" &&
        visionCompanyDescriptionController.value.text != "";
    notifyListeners();
  }

  VisionStatementModel dataModel = VisionStatementModel();

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

  List<VisionStatementModel> listDataModel = [];
  List<String> totalList = [];

  Future postTransactions({
    required String productName,
    required String productDescription,
    required String toneId,
    String? audience,
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
        "audience": audience ?? "",
      },
    );

    if (response.result!) {
      // Work
      // dataModel = response;
      for (var element in response.data!.descriptions!) {
        totalList.add(element.description!);
      }

      isDataAvailable = true;
      isLoading = false;
      notifyListeners();
    } else {
      isLoading = true;
      // Error
    }
  }
}
