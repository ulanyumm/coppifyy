import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/templates/site/CategoryPageDescriptions/categoryPage_model.dart';
import 'package:hypotenuse/screen/templates/site/CategoryPageDescriptions/categoryPage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryPageViewModel extends ChangeNotifier {
  CopifyServiceCategoryPage service = CopifyServiceCategoryPage();
  TextEditingController categoryPageCategoryController =
      TextEditingController();
  TextEditingController categoryPageTargetAudience = TextEditingController();
  TextEditingController categoryPageCompanyName = TextEditingController();
  TextEditingController categoryPageKeywordsController =
      TextEditingController();
  TextEditingController captionsEditController = TextEditingController();
  bool selectedDrafts = false;
  bool isGenerateAvailable = false;
  bool isCaptionChanged = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey categoryPagePostFormkey = GlobalKey();
  List<String> categoryPageKeywordsList = [];
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;

  String selectedToneId = "1";
  String selectedTone = "Conversational";
  Map<String, String> categoryPageToneMap = {
    "Conversational": '1',
    "Enthusiatic": '2',
    "Humorous": '3',
    "Professional": '4',
  };
  void DisposeAll() {
    categoryPageCategoryController.dispose();
    categoryPageTargetAudience.dispose();
    categoryPageCompanyName.dispose();
    categoryPageKeywordsController.dispose();
  }

  void categoryPageTone(String tone) {
    selectedTone = tone;
    selectedToneId = categoryPageToneMap[tone] ?? '1';
    notifyListeners();
  }

  void addItemToList(String etiket, BuildContext context) {
    categoryPageKeywordsList.add(etiket);
    notifyListeners();
  }

  void removeInterest(String etiket) {
    categoryPageKeywordsList.remove(etiket);
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

  checkAvailable(bool available) {
    isGenerateAvailable = available;
    notifyListeners();
  }

  CategoryPageModel dataModel = CategoryPageModel();
  List<CategoryPageModel> listDataModel = [];
  List<String> totalList = [];
  Future postTransactions({
    required String category,
    required String keywords,
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
        "category": category,
        "keywords": keywords,
        "tone_id": toneId,
        "audience": audience ?? '',
        "company_name": companyName ?? '',
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
