import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/templates/site/Faq/faq_model.dart';
import 'package:hypotenuse/screen/templates/site/Faq/faq_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FaqsScreenModelView extends ChangeNotifier {
  CopifyServiceFaq service = CopifyServiceFaq();
  TextEditingController faqsProductController = TextEditingController();
  TextEditingController faqsAudienceController = TextEditingController();
  TextEditingController faqsProductDescriptionController =
      TextEditingController();
  bool selectedDrafts = false;
  bool isGenerateAvailable = false;
  bool isCaptionChanged = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey faqsFormkey = GlobalKey();
  List<String> faqsKeywordsList = [];
  bool isButtonActive = false;
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;
  String selectedToneId = "1";
  String selectedTone = "Conversational";
  Map<String, String> faqsToneMap = {
    "Conversational": '1',
    "Enthusiatic": '2',
    "Humorous": '3',
    "Professional": '4',
  };
  void DisposeAll() {
    faqsProductController.dispose();
    faqsAudienceController.dispose();
    faqsProductDescriptionController.dispose();
  }

  void faqsTone(String tone) {
    selectedTone = tone;
    selectedToneId = faqsToneMap[tone] ?? '1';
    notifyListeners();
  }

  void animateContainer(BuildContext context) {
    selectedDrafts = !selectedDrafts;
    notifyListeners();
  }

  void isButtonActiveFunc() {
    isButtonActive = faqsProductController.value.text != "" &&
        faqsProductDescriptionController.value.text != "";
    notifyListeners();
  }

  void removeWidgetIndex(int index) {
    if (index >= 0 && index < totalList.length) {
      totalList.removeAt(index);
      notifyListeners();
    }
  }

  checkAvailable(bool available) {
    isGenerateAvailable = available;
    notifyListeners();
  }

  FaqModel dataModel = FaqModel();
  List<FaqModel> listDataModel = [];
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
