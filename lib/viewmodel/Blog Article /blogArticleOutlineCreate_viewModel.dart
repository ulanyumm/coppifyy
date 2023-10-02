import 'package:flutter/material.dart';

class BlogArticleOutlineCreateViewModel extends ChangeNotifier {
  TextEditingController outlineListController = TextEditingController();
  TextEditingController outlineListAddController = TextEditingController();
  GlobalKey<ScaffoldState> page3scaffoldkey = GlobalKey();
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;

  List<String> outlineList = [];

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
}
