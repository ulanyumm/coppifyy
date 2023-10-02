import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/templates/NewsletterCommons/EmailCopy/emailCopy_model.dart';
import 'package:hypotenuse/screen/templates/NewsletterCommons/EmailCopy/emailCopy_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmailCopyViewModel extends ChangeNotifier {
  CopifyServiceEmailCopy service = CopifyServiceEmailCopy();
  TextEditingController emailPurposeController = TextEditingController();
  TextEditingController emailTargetAudienceController = TextEditingController();
  TextEditingController emailCompanyNameController = TextEditingController();
  TextEditingController emailCopyKeywordsController = TextEditingController();
  TextEditingController captionsEditController = TextEditingController();
  bool isButtonActive = false;
  bool selectedDrafts = false;
  bool isGenerateAvailable = false;
  bool isCaptionChanged = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey emailCopyPostFormkey = GlobalKey();
  List<String> emailCopyKeywordsList = [];
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;
  String selectedToneId = "1";
  String selectedTone = "Conversational";
  Map<String, String> emailCopyToneMap = {
    "Conversational": '1',
    "Enthusiatic": '2',
    "Humorous": '3',
    "Professional": '4',
  };
  void DisposeAll() {
    emailPurposeController.dispose();
    emailTargetAudienceController.dispose();
    emailCompanyNameController.dispose();
    emailCopyKeywordsController.dispose();
  }

  void emailCopyTone(String tone) {
    selectedTone = tone;
    selectedToneId = emailCopyToneMap[tone] ?? '1';
    notifyListeners();
  }

  void isButtonActiveFunc() {
    isButtonActive = emailPurposeController.value.text != "" &&
        emailCopyKeywordsList.isNotEmpty;
    notifyListeners();
  }

  void addItemToList(String etiket, BuildContext context) {
    emailCopyKeywordsList.add(etiket);
    notifyListeners();
  }

  void removeInterest(String etiket) {
    emailCopyKeywordsList.remove(etiket);
    notifyListeners();
  }

  void animateContainer(BuildContext context) {
    selectedDrafts = !selectedDrafts;
    notifyListeners();
  }

  void removeWidgetIndex(int index) {
    if (index >= 0 && index < totalList.length) {
      totalList.removeAt(index);
      notifyListeners();
    }
  }

  EmailCopyModel dataModel = EmailCopyModel();

  checkAvailable(bool available) {
    isGenerateAvailable = available;
    notifyListeners();
  }

  List<EmailCopyModel> listDataModel = [];
  List<Mail> totalList = [];
  Future postTransactions({
    required String purpose,
    required String keywords,
    required String toneId,
    String? audience,
    String? brand,
  }) async {
    isLoading = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    final response = await service.postservice(
      token,
      {
        "purpose": purpose,
        "keywords": keywords,
        "tone_id": toneId,
        "audience": audience ?? "",
        "brand": brand ?? "",
      },
    );

    if (response.result!) {
      // Work
      // dataModel = response;
      for (var element in response.data!.mail!) {
        totalList.add(element);
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
