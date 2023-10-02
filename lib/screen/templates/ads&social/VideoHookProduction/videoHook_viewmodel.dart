import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/templates/ads&social/VideoHookProduction/videoHook_model.dart';
import 'package:hypotenuse/screen/templates/ads&social/VideoHookProduction/videoHook_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VideoHookViewModel extends ChangeNotifier {
  CopifyServiceVideoHook service = CopifyServiceVideoHook();
  TextEditingController videoTopicController = TextEditingController();
  TextEditingController videoHookAudience = TextEditingController();
  TextEditingController videoHookDetailBrand = TextEditingController();
  TextEditingController videoHookKeywordsController = TextEditingController();
  TextEditingController captionsEditController = TextEditingController();
  bool selectedDrafts = false;
  bool isGenerateAvailable = false;
  bool isCaptionChanged = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey videoHookPostFormkey = GlobalKey();
  List<String> videoHookKeywordsList = [];
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;
  String selectedToneId = "1";
  String selectedTone = "Conversational";
  Map<String, String> videoHookToneMap = {
    "Conversational": '1',
    "Enthusiatic": '2',
    "Humorous": '3',
    "Professional": '4',
  };
  void DisposeAll() {
    videoTopicController.dispose();
    videoHookAudience.dispose();
    videoHookDetailBrand.dispose();
    videoHookKeywordsController.dispose();
  }

  void videoHookTone(String tone) {
    selectedTone = tone;
    selectedToneId = videoHookToneMap[tone] ?? '1';
    notifyListeners();
  }

  void addItemToList(String etiket, BuildContext context) {
    videoHookKeywordsList.add(etiket);
    notifyListeners();
  }

  void removeInterest(String etiket) {
    videoHookKeywordsList.remove(etiket);
    notifyListeners();
  }

  void animateContainer(BuildContext context) {
    selectedDrafts = !selectedDrafts;
    notifyListeners();
  }

  String _text = '';
  String get text => _text;

  void updateText(String newText) {
    _text = newText;
    notifyListeners();
  }

  int _characterCount = 0;
  int get characterCount => _characterCount;
  void updateCharacterCount(String icerik) {
    _characterCount = icerik.length;
    () => notifyListeners();
  }

  checkAvailable(bool available) {
    isGenerateAvailable = available;
    notifyListeners();
  }

  VideoHookModel dataModel = VideoHookModel();

  List<VideoHookModel> listDataModel = [];
  List<VideoHook> totalList = [];

  void removeWidgetIndex(int index) {
    if (index >= 0 && index < totalList.length) {
      totalList.removeAt(index);
      notifyListeners();
    }
  }

  Future postTransactions({
    required String videoTopic,
    required String keywords,
    required String toneId,
    String? audience,
    String? brand,
  }) async {
    isLoading = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;

    Map<String, dynamic> requestBody = {
      "video_topic": videoTopic,
      "keywords": keywords,
      "tone_id": toneId,
      "audience": audience ?? "",
      "brand": brand ?? "",
    };

    final response = await service.postservice(token, requestBody);

    if (response.result!) {
      // Başarılı senaryo
      // dataModel = response;
      for (var element in response.data!.videoHooks!) {
        totalList.add(element.videoHook!);
      }
      listDataModel.add(response);
      isDataAvailable = true;
      isLoading = false;
      notifyListeners();
    } else {
      // Hata senaryosu
      isLoading = false;
      notifyListeners();
    }
  }
}
