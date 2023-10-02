import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/templates/ads&social/GoogleAds/googlepost_model.dart';
import 'package:hypotenuse/screen/templates/ads&social/GoogleAds/googlePost_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoogleAdsViewModel extends ChangeNotifier {
  GooglePostService service = GooglePostService();
  TextEditingController postAboutController = TextEditingController();
  TextEditingController keywordsController = TextEditingController();
  TextEditingController targetAudienceController = TextEditingController();
  TextEditingController brandsController = TextEditingController();

  bool selectedDrafts = false;
  bool isGenerateAvailable = false;
  bool isCaptionChanged = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey formKey = GlobalKey();
  List<String> googleAdsKeywordsList = [];
  bool isButtonActive = false;
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;
  String selectedToneId = "1";
  String selectedTone = "Conversational";
  Map<String, String> googleAdsToneMap = {
    "Conversational": '1',
    "Enthusiatic": '2',
    "Humorous": '3',
    "Professional": '4',
  };
  void DisposeAll() {
    postAboutController.dispose();
    keywordsController.dispose();
    targetAudienceController.dispose();
    brandsController.dispose();
  }

  void googleAdsTone(String tone) {
    selectedTone = tone;
    selectedToneId = googleAdsToneMap[tone] ?? '1';
    notifyListeners();
  }

  void isButtonactiveFunc() {
    isButtonActive = postAboutController.value.text != "" &&
        googleAdsKeywordsList.isNotEmpty != "";
    notifyListeners();
  }

  void addItemToList(String etiket, BuildContext context) {
    googleAdsKeywordsList.add(etiket);
    notifyListeners();
  }

  void removeInterest(String etiket) {
    googleAdsKeywordsList.remove(etiket);
    notifyListeners();
  }

  void animateContainer(BuildContext context) {
    selectedDrafts = !selectedDrafts;
    notifyListeners();
  }

  checkAvailable(bool available) {
    isGenerateAvailable = available;
    notifyListeners();
  }

  GooglePostModel dataModel = GooglePostModel();
  List<GooglePostModel> listDataModel = [];
  List<GoogleAdsV> totalList = [];
  Future postTransaction({
    required String? product,
    required String? keywords,
    required String? toneId,
    String? audience,
    String? brand,
  }) async {
    isLoading = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;

    Map<String, dynamic> requestBody = {
      "product": product,
      "keywords": keywords,
      "tone_id": toneId,
      "brand": brand ?? "",
      "audience": audience ?? "",
    };

    final response = await service.postservice(token, requestBody);

    if (response.result!) {
      // Başarılı senaryo
      // dataModel = response;

      for (var element in response.data!.googleAds!) {
        totalList.add(element.googleAds!);
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
