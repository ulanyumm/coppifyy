import 'package:flutter/cupertino.dart';

class GeneralModelViewModel extends ChangeNotifier {
  TextEditingController titleController = TextEditingController();
  TextEditingController audienceController = TextEditingController();
  TextEditingController keywordsController = TextEditingController();
  TextEditingController outlineListController = TextEditingController();
  List<String> generalKeywordsList = [];

  bool isGenerateAvailable = false;
  String selectedTypeId = "1";
  String selectedtypeArticle = "Scientific";
  Map<String, String> articleGeneratorTypeMap = {
    "Scientific": '1',
    "Technical": '2',
    "Essay": '3',
    "Opinion/Editorial": '4',
  };
  void addItemToList(String gelenVeri, BuildContext context) {
    generalKeywordsList.add(gelenVeri);
    notifyListeners();
  }

  List<String> animatedlist = [];
  final GlobalKey<AnimatedListState> animatedListkey = GlobalKey();
  void addAnimationItem(String newItem) {
    animatedlist.insert(0, newItem);
    animatedListkey.currentState?.insertItem(
      0,
      duration: const Duration(seconds: 1),
    );
    notifyListeners();
  }

  checkAvailable(bool available) {
    isGenerateAvailable = available;
    notifyListeners();
  }

  void articleGenerator(String type) {
    selectedtypeArticle = type;
    selectedTypeId = articleGeneratorTypeMap[type] ?? '1';
    notifyListeners();
  }

  void removeInterest(
    String gelenVeri,
  ) {
    generalKeywordsList.remove(gelenVeri);
    notifyListeners();
  }
}
