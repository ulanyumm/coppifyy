import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/templates/ads&social/VideoTimeLineTool/videoTimeline_model.dart';
import 'package:hypotenuse/screen/templates/ads&social/VideoTimeLineTool/videoTimeline_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VideoTimelineViewModel extends ChangeNotifier {
  CopifyServiceVideoTimeline service = CopifyServiceVideoTimeline();
  TextEditingController videoTopicController = TextEditingController();
  TextEditingController videoLengthController = TextEditingController();
  TextEditingController platformNameController = TextEditingController();
  bool isButtonActive = false;
  bool selectedDrafts = false;
  bool isGenerateAvailable = false;
  bool isCaptionChanged = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  GlobalKey videoTimelinePostFormkey = GlobalKey();
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;

  void DisposeAll() {
    videoTopicController.dispose();
    videoLengthController.dispose();
    platformNameController.dispose();
  }

  void isButtonActiveFunc() {
    isButtonActive = videoTopicController.value.text != "" &&
        videoLengthController.value.text != "" &&
        platformNameController.value.text != "";
    notifyListeners();
  }

  checkAvailable(bool available) {
    isGenerateAvailable = available;
    notifyListeners();
  }

  void removeWidget(Data item) {
    dataList.remove(item);
    notifyListeners();
  }

  VideoTimelineModel dataModel = VideoTimelineModel();
  List<Data> dataList = [];

  Future postTransactions({
    required String length,
    required String about,
    required String platform,
  }) async {
    isLoading = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    final response = await service.postservice(
      token,
      {
        "length": length,
        "about": about,
        "platform": platform,
      },
    );

    if (response.result!) {
      // Work
      dataModel = response;
      if (dataModel.data != null) {
        dataList.add(dataModel.data!);
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
