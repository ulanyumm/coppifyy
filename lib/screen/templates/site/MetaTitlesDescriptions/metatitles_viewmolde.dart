import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/templates/site/MetaTitlesDescriptions/metaTitle_model.dart';
import 'package:hypotenuse/screen/templates/site/MetaTitlesDescriptions/metatitle_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MetaTitlesPostViewModel extends ChangeNotifier {
  CopifyServiceMetatitle service = CopifyServiceMetatitle();
  TextEditingController metaTitlesProduct = TextEditingController();
  TextEditingController metaTitlesKeywords = TextEditingController();
  bool isGenerateAvailable = false;
  bool isCaptionChanged = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey metaTitlesPostFormkey = GlobalKey();
  List<String> metaTitlesKeywordsList = [];
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;
  void DisposeAll() {
    metaTitlesProduct.dispose();
    metaTitlesKeywords.dispose();
  }

  void addItemToList(String etiket, BuildContext context) {
    metaTitlesKeywordsList.add(etiket);
    notifyListeners();
  }

  void removeInterest(String etiket) {
    metaTitlesKeywordsList.remove(etiket);
    notifyListeners();
  }

  MetaTitleModel dataModel = MetaTitleModel();
  final String _text = '';
  String get text => _text;

  checkAvailable(bool available) {
    isGenerateAvailable = available;
    notifyListeners();
  }

  List<MetaTitleModel> listDataModel = [];
  List<MetaTitles2> totalList = [];
  void removeWidgetIndex(int index) {
    if (index >= 0 && index < totalList.length) {
      totalList.removeAt(index);
      notifyListeners();
    }
  }

  Future postTransactions({
    required String product,
    required String keywords,
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
      },
    );

    if (response.result!) {
      // Work
      //  dataModel = response;
      for (var element in response.data!.metaTitles!) {
        totalList.add(element.metaTitles!);
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
