import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/templates/ads&social/FacebookAds/facebookAds_model.dart';
import 'package:hypotenuse/screen/templates/ads&social/FacebookAds/facebookAds_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FacebookAdsViewModel extends ChangeNotifier {
  FacebookAdsService service = FacebookAdsService();
  TextEditingController productController = TextEditingController();
  TextEditingController keywordsController = TextEditingController();
  TextEditingController targetAudienceController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  bool selectedDrafts = false;
  bool isGenerateAvailable = false;
  bool isCaptionChanged = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey formKey = GlobalKey();
  List<String> facebookAdsKeywordsList = [];
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;
  String selectedToneId = "1";
  String selectedTone = "Conversational";
  Map<String, String> facebookAdsToneMap = {
    "Conversational": '1',
    "Enthusiatic": '2',
    "Humorous": '3',
    "Professional": '4',
  };
  void DisposeAll() {
    productController.dispose();
    keywordsController.dispose();
    targetAudienceController.dispose();
    brandController.dispose();
  }

  void facebookAdsTone(String tone) {
    selectedTone = tone;
    selectedToneId = facebookAdsToneMap[tone] ?? '1';
    notifyListeners();
  }

  void addItemToList(String etiket, BuildContext context) {
    facebookAdsKeywordsList.add(etiket);
    notifyListeners();
  }

  void removeInterest(String etiket) {
    facebookAdsKeywordsList.remove(etiket);
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

  void removeWidgetIndex(int index) {
    if (index >= 0 && index < totalAds.length) {
      totalAds.removeAt(index);
      notifyListeners();
    }
  }

  void removeWidgetIndexFunc(int index) {
    if (index >= 0 && index < totalAdv.length) {
      totalAdv.removeAt(index);
      notifyListeners();
    }
  }

  FacebookAdsModel dataModel = FacebookAdsModel();
  List<FacebookAdsModel> listDataModel = [];
  List<FaceAdsv> totalAds = [];
  List<FaceAds> totalAdv = [];
  Future facebookAdsPost({
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

    final response = await service.facebookAdsservice(token, requestBody);

    if (response.result!) {
      // Başarılı senaryo
      // dataModel = response;
      for (var element in response.data!.faceAds!) {
        totalAds.add(element.faceAds!);
      }
      for (var element in response.data!.faceAds!) {
        totalAdv.add(element);
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
