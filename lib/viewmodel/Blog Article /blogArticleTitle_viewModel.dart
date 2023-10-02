import 'package:flutter/material.dart';
import 'package:hypotenuse/model/blog%20Article/blogArticleTitle_Model.dart';
import 'package:hypotenuse/service/blogArticlePost_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BlogArticleTitleViewModel extends ChangeNotifier {
  CopifyServiceBlogArticleGenerator service =
      CopifyServiceBlogArticleGenerator();
  GlobalKey page2key = GlobalKey();
  GlobalKey<ScaffoldState> page2scaffoldkey = GlobalKey();
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;
  List<String> selectedTitles = [];
  String? selectedTitle;
  List<String> articleTitleList = [
    "Unveiling the Untold Story of Hasan: A Journey of Triumph and Resilience",
    "Delving into the Life and Times of Hasan: Unraveling the Mystery Behind his Success",
    "Discovering Hasan's Secret to Success: Unleashing the Power Within",
    "Hasan: Exploring the Depths of his Extraordinary Talents and Achievements",
    "Hasan: The Inspiring Tale of Overcoming Adversity and Embracing Greatness",
    "Hasan: Redefining Boundaries and Shattering Stereotypes in Pursuit of Excellence",
  ];

  void titleSelectionFunc(String title) {
    selectedTitles = [title]; // Sadece seçilen başlığı sakla
    notifyListeners();
  }

  bool isTitleSelected(String title) {
    return selectedTitle == title;
  }

  void titleselectionFunc(String title) {
    if (selectedTitles.contains(title)) {
      selectedTitles.remove(title);
    } else {
      selectedTitles.add(title);
    }
    notifyListeners();
  }

  //Data İşlemleri

  BlogArticleTitleModel dataModel = BlogArticleTitleModel();

  Future postTitle({
    required String selfTitle,
  }) async {
    isLoading = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;

    Map<String, dynamic> requestBody = {
      "self_title": selfTitle,
    };

    final response = await service.titleService(token, requestBody);

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
  }
}
