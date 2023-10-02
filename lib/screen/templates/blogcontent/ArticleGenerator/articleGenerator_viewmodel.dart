import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/templates/blogcontent/ArticleGenerator/articleGenerator_model.dart';
import 'package:hypotenuse/screen/templates/blogcontent/ArticleGenerator/articleGenerator_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArticleGeneratorViewModel extends ChangeNotifier {
  List<String> outlineList = [];
  CopifyServiceArticleGenerator service = CopifyServiceArticleGenerator();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey articleGeneratorFormkey = GlobalKey();
  TextEditingController titleController = TextEditingController();
  TextEditingController audienceController = TextEditingController();
  TextEditingController keywordsController = TextEditingController();
  TextEditingController outlineListController = TextEditingController();
  bool isActiveButton = false;
  List<String> generalKeywordsList = [];
  bool isGenerateAvailable = false;
  String selectedType = "Scientific";
  List<String> articleGeneratorTypeMap = [
    "Scientific",
    "Technical",
    "Essay",
    "Opinion/Editorial"
  ];

  void addItemOutlineList(String newItem, BuildContext context) {
    outlineList.add(newItem);
    notifyListeners();
  }

  void removeItemOutlineList(int index) {
    if (index >= 0 && index < outlineList.length) {
      outlineList.removeAt(index);
      notifyListeners();
    }
  }

  void addItemToList(String gelenVeri, BuildContext context) {
    generalKeywordsList.add(gelenVeri);
    notifyListeners();
  }

  checkActiveButton(
    String title,
  ) {
    if (titleController.text.isNotEmpty) {
      isActiveButton = true;
    }
    notifyListeners();
  }

  checkAvailable(bool available) {
    isGenerateAvailable = available;
    notifyListeners();
  }

  void removeInterest(
    String gelenVeri,
  ) {
    generalKeywordsList.remove(gelenVeri);
    notifyListeners();
  }

  List<Data> dataList = [];
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;

  bool introduction = false;
  bool conclusion = false;

  void setSelectedType(String value) {
    selectedType = value;
    notifyListeners();
  }

  ArticleGeneratorModel dataModel = ArticleGeneratorModel();

  Future postTransaction({
    required String? title,
    required String? selectedType,
    required List<String>? keywords,
    List<String>? outlines,
    String? audience,
  }) async {
    isLoading = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;

    // İstek gövdesini oluşturma
    Map<String, dynamic> requestBody = {
      "title": title,
      "type": selectedType,
      "outlines": outlines ?? [],
      "audience": audience ?? "",
      "keywords": keywords,
    };

    try {
      final response =
          await CopifyServiceArticleGenerator().postService(token, requestBody);

      // Response'dan gelen verileri işleme
      if (response.result!) {
        //  String keywordsString = response.keywords!.join(",");
        //  List<String> keywordsList = keywordsString.split(",");

        // Başarılı senaryo
        /*  dataModel = ArticleGeneratorModel(
          result: true,
          keywords: keywordsList,
        ); */
        dataModel = response;

        isDataAvailable = true;
      } else {
        // Hata senaryosu
        // Hata mesajını veya işleme koymak istediğiniz herhangi bir bilgiyi burada ele alabilirsiniz.
      }
    } catch (e) {
      // Hata durumunu ele alın
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
