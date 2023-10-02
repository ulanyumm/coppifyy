import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/templates/NewsletterCommons/EventPromotionEmail/eventPromotion_model.dart';
import 'package:hypotenuse/screen/templates/NewsletterCommons/EventPromotionEmail/eventPromotion_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventPromotionViewModel extends ChangeNotifier {
  CopifyServiceEventPromotion service = CopifyServiceEventPromotion();
  TextEditingController eventPromotionEventController = TextEditingController();
  TextEditingController eventPromotionDetailsController =
      TextEditingController();
  TextEditingController eventPromotionReasonController =
      TextEditingController();
  TextEditingController captionsEditController = TextEditingController();
  bool isGenerateAvailable = false;
  bool isCaptionChanged = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey eventPromotionFormkey = GlobalKey();
  List<String> eventPromotionKeywordsList = [];
  bool isButtonActive = false;
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;
  String selectedToneId = "1";
  String selectedTone = "Conversational";
  Map<String, String> eventPromotionToneMap = {
    "Conversational": '1',
    "Enthusiatic": '2',
    "Humorous": '3',
    "Professional": '4',
  };
  void DisposeAll() {
    eventPromotionEventController.dispose();
    eventPromotionDetailsController.dispose();
    eventPromotionReasonController.dispose();
  }

  void eventPromotionTone(String tone) {
    selectedTone = tone;
    selectedToneId = eventPromotionToneMap[tone] ?? '1';
    notifyListeners();
  }

  void isButtonActiveFunc() {
    isButtonActive = eventPromotionEventController.value.text != "" &&
        eventPromotionDetailsController.value.text != "";
    notifyListeners();
  }

  void removeWidgetIndex(int index) {
    if (index >= 0 && index < totalList.length) {
      totalList.removeAt(index);
      notifyListeners();
    }
  }

  EventPromotionModel dataModel = EventPromotionModel();

  checkAvailable(bool available) {
    isGenerateAvailable = available;
    notifyListeners();
  }

  EventPromotionModel eventPromotionModel = EventPromotionModel();
  List<EventPromotionModel> listDataModel = [];
  List<String> totalList = [];
  Future postTransactions({
    required String topic,
    required String detail,
    required String toneId,
    String? reason,
  }) async {
    isLoading = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    final response = await service.postservice(
      token,
      {
        "topic": topic,
        "detail": detail,
        "tone_id": toneId,
        "reason": reason ?? '',
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
