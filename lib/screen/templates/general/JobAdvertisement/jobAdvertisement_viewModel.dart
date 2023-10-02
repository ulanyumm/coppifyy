import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/templates/general/JobAdvertisement/jobAdvertisement_model.dart';
import 'package:hypotenuse/screen/templates/general/JobAdvertisement/jobAdvertisement_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JobAdvertisementViewModel extends ChangeNotifier {
  JobAdvertisementService service = JobAdvertisementService();
  TextEditingController jobController = TextEditingController();
  TextEditingController jobInfojobInfoController = TextEditingController();
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
  void DisposeAll() {
    jobController.dispose();
    jobInfojobInfoController.dispose();
    employee.dispose();
    companyName.dispose();
  }

  void instaTone(String tone) {
    selectedTone = tone;
    selectedToneId = jobToneMap[tone] ?? '1';
    notifyListeners();
  }

  void animateContainer(BuildContext context) {
    selectedDrafts = !selectedDrafts;
    notifyListeners();
  }

  bool isActiveButton = false;
  checkActiveButton(
      {required String job,
      required String jobInfo,
      required String employee}) {
    if (job.isNotEmpty && jobInfo.isNotEmpty && employee.isNotEmpty) {
      isActiveButton = true;
      print("active ");
    } else {
      print("passive ");
      isActiveButton = false;
    }
    notifyListeners();
  }

  List<Data> dataList = [];

  void removeWidgetIndex(int index) {
    if (index >= 0 && index < totalAds.length) {
      totalAds.removeAt(index);
      notifyListeners();
    }
  }

  void removeWidget(int item) {
    dataList.remove(item);
    notifyListeners();
  }

  JobAdvertisementModel jobAdvertisementpostModel = JobAdvertisementModel();
  List<JobAdvertisementModel> listDataModel = [];
  List<String> totalAds = [];
  Future jobAdvertsingPost({
    required String job,
    required String info,
    required String looking,
    required String toneId,
    String? companyName,
  }) async {
    isLoading = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;

    Map<String, dynamic> requestBody = {
      "job": job,
      "info": info,
      "looking": looking,
      "company_name": companyName ?? '',
      "tone_id": toneId,
    };

    final response = await service.jobAdverts(token, requestBody);

    if (response.result!) {
      // Başarılı senaryo
      jobAdvertisementpostModel = response;
      for (var element in response.data!.descriptions!) {
        totalAds.add(element.description!);
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
