import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/templates/ads&social/ContestGiveway/contestGiveway_service.dart';
import 'package:hypotenuse/screen/templates/ads&social/ContestGiveway/contestPost_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContestGiveViewModel extends ChangeNotifier {
  CopifyServiceContestPost service = CopifyServiceContestPost();
  ContestPostModel contestModel = ContestPostModel();
  TextEditingController contestLookinFor = TextEditingController();
  TextEditingController contestPrize = TextEditingController();
  TextEditingController contestClaim = TextEditingController();
  TextEditingController contestTargetAudience = TextEditingController();
  TextEditingController captionsEditController = TextEditingController();
  bool selectedDrafts = false;
  bool isGenerateAvailable = false;
  bool isCaptionChanged = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey contestFormkey = GlobalKey();
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;
  String selectedToneId = "1";
  String selectedTone = "Conversational";
  Map<String, String> contestToneMap = {
    "Conversational": '1',
    "Enthusiatic": '2',
    "Humorous": '3',
    "Professional": '4',
  };
  void DisposeAll() {
    contestLookinFor.dispose();
    contestPrize.dispose();
    contestClaim.dispose();
    contestTargetAudience.dispose();
    captionsEditController.dispose();
  }

  void instaTone(String tone) {
    selectedTone = tone;
    selectedToneId = contestToneMap[tone] ?? '1';
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

  List<ContestPostModel> listDataModel = [];
  List<String> totalList = [];
  Future postTransactions({
    required String aim,
    required String way,
    required String prize,
    required String toneId,
    String? brand,
  }) async {
    isLoading = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    final response = await service.postservice(
      token,
      {
        "aim": aim,
        "way": way,
        "prize": prize,
        "tone_id": toneId,
        "brand": brand ?? "",
      },
    );

    if (response.result!) {
      // Work

      //contestModel = response;
      for (var element in response.data!.promotions!) {
        totalList.add(element.contest!);
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
