import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/templates/site/LandingPageContent/landingPage_model.dart';
import 'package:hypotenuse/screen/templates/site/LandingPageContent/landingPage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPageContentViewModel extends ChangeNotifier {
  CopifyServiceLandingPage service = CopifyServiceLandingPage();
  TextEditingController landingPageProductController = TextEditingController();
  TextEditingController landingPageNameProductController =
      TextEditingController();
  TextEditingController landingPageCompannyNameController =
      TextEditingController();
  TextEditingController landingPageKeywordsController = TextEditingController();
  TextEditingController landingPageTargetKeywordsController =
      TextEditingController();
  TextEditingController landingPageCompanyNameController =
      TextEditingController();

  TextEditingController captionsEditController = TextEditingController();
  bool selectedDrafts = false;
  bool isGenerateAvailable = false;
  bool isCaptionChanged = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey landingPageFormkey = GlobalKey();
  List<String> landingPageKeywordsList = [];
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;
  String selectedToneId = "1";
  String selectedTone = "Conversational";
  Map<String, String> landingPageToneMap = {
    "Conversational": '1',
    "Enthusiatic": '2',
    "Humorous": '3',
    "Professional": '4',
  };
  void DisposeAll() {
    landingPageProductController.dispose();
    landingPageNameProductController.dispose();
    landingPageCompannyNameController.dispose();
    landingPageKeywordsController.dispose();
    landingPageTargetKeywordsController.dispose();
    landingPageCompanyNameController.dispose();
  }

  void landingPageTone(String tone) {
    selectedTone = tone;
    selectedToneId = landingPageToneMap[tone] ?? '1';
    notifyListeners();
  }

  void addItemToList(String etiket, BuildContext context) {
    landingPageKeywordsList.add(etiket);
    notifyListeners();
  }

  void removeInterest(String etiket) {
    landingPageKeywordsList.remove(etiket);
    notifyListeners();
  }

  void animateContainer(BuildContext context) {
    selectedDrafts = !selectedDrafts;
    notifyListeners();
  }

  LandingPageModel dataModel = LandingPageModel();
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

  List<LandingPageModel> listDataModel = [];
  List<Landingpage> totalList = [];

  Future postTransactions({
    required String product,
    required String features,
    required String description,
    required String toneId,
    String? audience,
    String? companyName,
  }) async {
    isLoading = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    final response = await service.postservice(
      token,
      {
        "description": description,
        "product": product,
        "features": features,
        "tone_id": toneId,
        "audience": audience ?? "",
        "company_name": companyName ?? "",
      },
    );

    if (response.result!) {
      // Work
      //  dataModel = response;
      for (var element in response.data!.landingpages!) {
        totalList.add(element.landingpage!);
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
