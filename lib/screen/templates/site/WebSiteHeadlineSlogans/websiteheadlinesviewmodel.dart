import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/templates/site/WebSiteHeadlineSlogans/websiteHeadline_model.dart';
import 'package:hypotenuse/screen/templates/site/WebSiteHeadlineSlogans/websiteHeadline_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WebsiteHeadlinesViewModel extends ChangeNotifier {
  CopifyServiceWebsiteHeadline service = CopifyServiceWebsiteHeadline();
  TextEditingController websiteProductController = TextEditingController();
  TextEditingController websiteTargetAudience = TextEditingController();
  TextEditingController websiteBrandController = TextEditingController();
  TextEditingController websiteKeywordsController = TextEditingController();
  bool selectedDrafts = false;
  bool isGenerateAvailable = false;
  bool isCaptionChanged = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey websitePostFormkey = GlobalKey();
  List<String> websiteKeywordsList = [];
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;
  String selectedToneId = "1";
  String selectedTone = "Conversational";
  Map<String, String> websiteToneMap = {
    "Conversational": '1',
    "Enthusiatic": '2',
    "Humorous": '3',
    "Professional": '4',
  };
  void DisposeAll() {
    websiteProductController.dispose();
    websiteTargetAudience.dispose();
    websiteBrandController.dispose();
    websiteKeywordsController.dispose();
  }

  void websiteTone(String tone) {
    selectedTone = tone;
    selectedToneId = websiteToneMap[tone] ?? '1';
    notifyListeners();
  }

  void addItemToList(String etiket, BuildContext context) {
    websiteKeywordsList.add(etiket);
    notifyListeners();
  }

  void removeInterest(String etiket) {
    websiteKeywordsList.remove(etiket);
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

  WebsiteHeadlineModel dataModel = WebsiteHeadlineModel();

  checkAvailable(bool available) {
    isGenerateAvailable = available;
    notifyListeners();
  }

  List<WebsiteHeadlineModel> listDataModel = [];
  List<String> totalList = [];
  Future postTransactions({
    required String product,
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
        "product": product,
        "keywords": keywords,
        "tone_id": toneId,
        "audience": audience ?? "",
        "brand": brand ?? "",
      },
    );

    if (response.result!) {
      // Work
      // dataModel = response;
      for (var element in response.data!.headlines!) {
        totalList.add(element.headline!);
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
