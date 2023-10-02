import 'package:flutter/material.dart';
import 'package:hypotenuse/model/blog%20Article/blogArticleProject_model.dart';
import 'package:hypotenuse/service/blogArticlePost_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BlogArticleProjectViewModel extends ChangeNotifier {
  CopifyServiceBlogArticleGenerator service =
      CopifyServiceBlogArticleGenerator();
  TextEditingController describleTopicController = TextEditingController();
  TextEditingController keywordsController = TextEditingController();
  TextEditingController audienceController = TextEditingController();
  TextEditingController titlesController = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  bool isActiveButton = false;
  GlobalKey page1key = GlobalKey();

  List<String> keywordsList = [];
  bool selectedDrafts = false;
  GlobalKey<ScaffoldState> page1scaffoldkey = GlobalKey();

  bool isGenerateAvailable = false;
  bool selectedJob = false;
  bool selectedMoreOptions = false;
  bool isChecked = false;
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;
  String selectedToneId = "1";
  String selectedTone = "Conversational";
  Map<String, String> toneMap = {
    "Conversational": '1',
    "Enthusiatic": '2',
    "Humorous": '3',
    "Professional": '4',
  };
  String articleTabGeneratorId = "2";
  String articleTabSelected = "Second Person";
  bool isTabChecked = false;
  List articleGeneratorTabs = [
    "First Person",
    "Second Person",
    "Third Person",
  ];

  String tabName = "";
  int selectedTabIndex = -1;

  void articleTabButton(int value) {
    selectedTabIndex = value;
    tabName = articleGeneratorTabs[value];
    isTabChecked = true;
    notifyListeners();
  }

  void checkAvailable(bool available) {
    isGenerateAvailable = available;
    notifyListeners();
  }

  void selectToneFunc(String tone) {
    selectedTone = tone;
    selectedToneId = toneMap[tone] ?? '1';
    notifyListeners();
  }

  void isButtonActiveFunc() {
    if (describleTopicController.text.isNotEmpty && keywordsList.isNotEmpty) {
      isActiveButton = true;
      print("active ");
    } else {
      print("passive ");
      isActiveButton = false;
    }
    notifyListeners();
  }

  void addItemToList(String etiket, BuildContext context) {
    keywordsList.add(etiket);
    notifyListeners();
  }

  void removeInterest(String etiket) {
    keywordsList.remove(etiket);
    notifyListeners();
  }

  void animateContainer(BuildContext context) {
    selectedDrafts = !selectedDrafts;
    notifyListeners();
  }

  void setSelectedButtons(int index) {
    for (int i = 0; i < articleGeneratorTabs.length; i++) {
      articleGeneratorTabs[i] = (i == index);
    }
    notifyListeners();
  }

  BlogArticleProjectModel dataModel = BlogArticleProjectModel();

  Future postProject({
    required String topic,
    required List<dynamic>? keywords,
    required String toneId,
    String? viewId,
    String? audience,
  }) async {
    isLoading = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;

    print("topic: $topic}");
    print("toneId: $toneId}");

    Map<String, dynamic> requestBody = {
      "topic": topic,
      "keywords": keywords,
      "tone_id": toneId,
      "view_id": viewId ?? '',
      "audience": audience ?? '',
    };

    /* final response = await service.projectService(
      token,
      BlogArticleProjectModel(
        topic: topic,
        keywords: keywords,
        viewId: viewId ?? "2",
        audience: audience ?? "aud",
        toneId: toneId,
      ),
    );

    if (response.result!) {
      // Başarılı senaryo
      dataModel = response;
      isDataAvailable = true;
    } else {
      // Hata senaryosu
      isDataAvailable = false;
    }

    isLoading = false;
    notifyListeners();
  } */
  }
}
