import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/templates/ads&social/LinkedinPost/linkedinPostModel.dart';
import 'package:hypotenuse/screen/templates/ads&social/LinkedinPost/linkedin_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LinkedinPostsViewModel extends ChangeNotifier {
  CopifyServiceLinkednPost service = CopifyServiceLinkednPost();
  TextEditingController postAboutController = TextEditingController();
  TextEditingController additionalContextController = TextEditingController();
  TextEditingController targetAudienceController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  bool selectedDrafts = false;
  bool isGenerateAvailable = false;
  bool isCaptionChanged = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey formKey = GlobalKey();
  List<String> linkedinPostsKeywordsList = [];
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;
  String selectedToneId = "1";
  String selectedTone = "Conversational";
  Map<String, String> linkedinAdsToneMap = {
    "Conversational": '1',
    "Enthusiatic": '2',
    "Humorous": '3',
    "Professional": '4',
  };
  void DisposeAll() {
    postAboutController.dispose();
    additionalContextController.dispose();
    targetAudienceController.dispose();
    brandController.dispose();
  }

  void linkedinAdsTone(String tone) {
    selectedTone = tone;
    selectedToneId = linkedinAdsToneMap[tone] ?? '1';
    notifyListeners();
  }

  void addItemToList(String etiket, BuildContext context) {
    linkedinPostsKeywordsList.add(etiket);
    notifyListeners();
  }

  void removeInterest(String etiket) {
    linkedinPostsKeywordsList.remove(etiket);
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
    if (index >= 0 && index < totalList.length) {
      totalList.removeAt(index);
      notifyListeners();
    }
  }

  LinkedinPostModel linkedinPostModel = LinkedinPostModel();
  List<LinkedinPostModel> listDataModel = [];
  List<String> totalList = [];
  Future postTransactions({
    required String postContent,
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
        "post_content": postContent,
        "keywords": keywords,
        "tone_id": toneId,
        "audience": audience ?? "",
        "company_name": companyName ?? "",
      },
    );

    if (response.result!) {
      // Work
      // linkedinPostModel = response;
      for (var element in response.data!.linkedinPosts!) {
        totalList.add(element.linkedinPost!);
      }
      isDataAvailable = true;
      isLoading = false;
      notifyListeners();
    } else {
      isLoading = true;
      // Error
    }
  }
}
