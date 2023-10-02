import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/templates/site/SocialMediaBioWriters/socialMediaBio_model.dart';
import 'package:hypotenuse/screen/templates/site/SocialMediaBioWriters/socialMediaBio_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SocialMediaBioViewModel extends ChangeNotifier {
  CopifyServiceSocialBio service = CopifyServiceSocialBio();
  TextEditingController socialMediaBioMediaController = TextEditingController();
  TextEditingController socialMediaBioNameController = TextEditingController();
  TextEditingController socialMediaBioKeyPointsController =
      TextEditingController();
  TextEditingController captionsEditController = TextEditingController();
  bool isGenerateAvailable = false;
  bool isCaptionChanged = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey socialMediaBioMediaFormkey = GlobalKey();
  List<String> socialMediaBioMediaKeywordsList = [];
  bool isButtonActive = false;
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;
  String selectedToneId = "1";
  String selectedTone = "Conversational";
  Map<String, String> socialMediaBioMediaToneMap = {
    "Conversational": '1',
    "Enthusiatic": '2',
    "Humorous": '3',
    "Professional": '4',
  };
  void DisposeAll() {
    socialMediaBioMediaController.dispose();
    socialMediaBioNameController.dispose();
    socialMediaBioKeyPointsController.dispose();
  }

  void instaTone(String tone) {
    selectedTone = tone;
    selectedToneId = socialMediaBioMediaToneMap[tone] ?? '1';
    notifyListeners();
  }

  void addItemToList(String etiket, BuildContext context) {
    socialMediaBioMediaKeywordsList.add(etiket);
    notifyListeners();
  }

  void isButtonActiveFunc() {
    isButtonActive = socialMediaBioMediaController.value.text != "" &&
        socialMediaBioNameController.value.text != "" &&
        socialMediaBioKeyPointsController.value.text != "";

    notifyListeners();
  }

  void removeInterest(String etiket) {
    socialMediaBioMediaKeywordsList.remove(etiket);
    notifyListeners();
  }

  SocialBioWritersModel dataModel = SocialBioWritersModel();
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

  List<SocialBioWritersModel> listDataModel = [];
  List<String> totalList = [];
  Future postTransactions({
    required String media,
    required String keyPoints,
    required String toneId,
    String? name,
  }) async {
    isLoading = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    final response = await service.postservice(
      token,
      {
        "media": media,
        "key_points": keyPoints,
        "tone_id": toneId,
        "name": name ?? "",
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
