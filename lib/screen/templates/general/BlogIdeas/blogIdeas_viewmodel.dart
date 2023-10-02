import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/templates/general/BlogIdeas/blogIdeas_model.dart';
import 'package:hypotenuse/screen/templates/general/BlogIdeas/blogIdeas_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BlogIdeasViewModel extends ChangeNotifier {
  BlogIdeasService service = BlogIdeasService();
  TextEditingController blogAbout = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey formkey = GlobalKey();
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;

  BlogIdeasModel blogIdeaModel = BlogIdeasModel();
  List<BlogIdeasModel> listDataModel = [];
  List<Descriptions> totalList = [];
  List<Data> dataList = [];

  void DisposeAll() {
    blogAbout.dispose();
  }

  void removeWidget(Data item) {
    dataList.remove(item);
    notifyListeners();
  }

  bool isActiveButton = false;
  checkActiveButton() {
    if (blogAbout.text.isNotEmpty) {
      isActiveButton = true;
    }
    notifyListeners();
  }

  Future blogIdeaPost({
    required String about,
  }) async {
    isLoading = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;

    Map<String, dynamic> requestBody = {
      "about": about,
    };

    final response = await service.blogIdeasService(token, requestBody);

    if (response.result!) {
      // Başarılı senaryo
      blogIdeaModel = response;
      isDataAvailable = true;
      isLoading = false;
      notifyListeners();
      if (blogIdeaModel.data != null) {
        //Listenin liste olarak dayatılması
        dataList.add(blogIdeaModel.data!);
      } else {
        // Hata senaryosu
        isLoading = false;
        notifyListeners();
      }
    }
  }
}
