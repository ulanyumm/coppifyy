import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobAdvertisementViewModel extends ChangeNotifier {
  TextEditingController job = TextEditingController();
  TextEditingController jobInfo = TextEditingController();
  TextEditingController employee = TextEditingController();
  TextEditingController companyName = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  bool selectedDrafts = false;
  GlobalKey key = GlobalKey();
  bool selectedJob = false;
  bool selectedMoreOptions = false;
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;
  String selectedToneId = "1";
  String selectedTone = "Conversational";
  Map<String, String> jobToneMap = {
    "Conversational": '1',
    "Enthusiatic": '2',
    "Humorous": '3',
    "Professional": '4',
  };

  void instaTone(String tone) {
    selectedTone = tone;
    selectedToneId = jobToneMap[tone] ?? '1';
    notifyListeners();
  }

  void animateContainer(BuildContext context) {
    selectedDrafts = !selectedDrafts;
    notifyListeners();
  }
}
