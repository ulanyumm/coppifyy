import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/templates/NewsletterCommons/PressRelease/pressRelease_model.dart';
import 'package:hypotenuse/screen/templates/NewsletterCommons/PressRelease/pressRelease_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PressReleasesViewModel extends ChangeNotifier {
  CopifyServicePressRelease service = CopifyServicePressRelease();
  TextEditingController pressReleasesCompanyDescriptions =
      TextEditingController();
  TextEditingController pressReleasesCompanyNameController =
      TextEditingController();
  TextEditingController pressReleasesAnnouncementsController =
      TextEditingController();
  TextEditingController captionsEditController = TextEditingController();
  bool isButtonActive = false;
  bool selectedDrafts = false;
  bool isGenerateAvailable = false;
  bool isCaptionChanged = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey pressReleasesPostFormkey = GlobalKey();

  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;
  void DisposeAll() {
    pressReleasesCompanyDescriptions.dispose();
    pressReleasesCompanyNameController.dispose();
    pressReleasesAnnouncementsController.dispose();
  }

  void isButtonActiveFunc() {
    isButtonActive = pressReleasesCompanyDescriptions.value.text != "" &&
        pressReleasesCompanyNameController.value.text != "" &&
        pressReleasesAnnouncementsController.value.text != "";
    notifyListeners();
  }

  PressReleaseModel datamodel = PressReleaseModel();

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

  List<PressReleaseModel> listDataModel = [];
  List<String> totalList = [];
  Future postTransactions({
    required String companyDescription,
    required String companyName,
    required String announcement,
  }) async {
    isLoading = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    final response = await service.postservice(
      token,
      {
        "company_description": companyDescription,
        "company_name": companyName,
        "announcement": announcement
      },
    );

    if (response.result!) {
      // Work
      // datamodel = response;
      for (var element in response.data!.pressreleases!) {
        totalList.add(element.pressrelease!);
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
