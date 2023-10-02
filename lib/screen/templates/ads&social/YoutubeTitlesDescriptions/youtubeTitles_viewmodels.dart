import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/templates/ads&social/YoutubeTitlesDescriptions/youtubePost_model.dart';
import 'package:hypotenuse/screen/templates/ads&social/YoutubeTitlesDescriptions/youtubePost_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YoutubeTitlesViewModel extends ChangeNotifier {
  CopifyServiceYoutubePost service = CopifyServiceYoutubePost();
  TextEditingController videoTopicController = TextEditingController();
  TextEditingController youtubeKeywordsController = TextEditingController();
  TextEditingController youtubeAudience = TextEditingController();
  TextEditingController youtubeBrand = TextEditingController();
  bool selectedDrafts = false;
  bool isGenerateAvailable = false;
  bool isCaptionChanged = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey formKey = GlobalKey();
  List<String> youtubeKeywordsList = [];
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;
  String selectedToneId = "1";
  String selectedTone = "Conversational";
  Map<String, String> youtubeToneMap = {
    "Conversational": '1',
    "Enthusiatic": '2',
    "Humorous": '3',
    "Professional": '4',
  };
  void DisposeAll() {
    videoTopicController.dispose();
    youtubeKeywordsController.dispose();
    youtubeAudience.dispose();
    youtubeBrand.dispose();
  }

  void youtubeTone(String tone) {
    selectedTone = tone;
    selectedToneId = youtubeToneMap[tone] ?? '1';
    notifyListeners();
  }

  void addItemToList(String etiket, BuildContext context) {
    youtubeKeywordsList.add(etiket);
    notifyListeners();
  }

  void removeInterest(String etiket) {
    youtubeKeywordsList.remove(etiket);
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

  YoutubePostModel dataModel = YoutubePostModel();
  List<YoutubePostModel> listDataModel = [];
  List<YoutubeContent> totalList = [];
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
    final response = await service.postservice(
      token,
      {
        "video_topic": videoTopic,
        "keywords": keywords,
        "tone_id": toneId,
        "audience": audience ?? "",
        "brand": brand ?? "",
      },
    );

    if (response.result!) {
      // Work
      // dataModel = response;
      /* for (var element in response.data!.youtubeContents!) {
        totalAds.add(element);
      }
      for (var element in response.data!.youtubeContents!) {
        totalAdv.add(element.youtubeContent!);
      }
      listDataModel.add(response); */

      for (var element in response.data!.youtubeContents!) {
        totalList.add(element.youtubeContent!);
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
