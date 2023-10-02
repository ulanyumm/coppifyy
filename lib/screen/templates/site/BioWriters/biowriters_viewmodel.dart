import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/templates/site/BioWriters/bioWriters_model.dart';
import 'package:hypotenuse/screen/templates/site/BioWriters/bioWriters_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BioWritersViewModel extends ChangeNotifier {
  CopifyServiceBioWriter service = CopifyServiceBioWriter();
  TextEditingController bioWriterAboutController = TextEditingController();
  TextEditingController bioWriterCompanyNameController =
      TextEditingController();
  TextEditingController bioWriterTargetAudienceController =
      TextEditingController();
  TextEditingController bioWriterBrandController = TextEditingController();
  TextEditingController bioWriterKeywordsController = TextEditingController();
  TextEditingController captionsEditController = TextEditingController();
  bool selectedDrafts = false;
  bool isGenerateAvailable = false;
  bool isCaptionChanged = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey bioWriterPostFormkey = GlobalKey();
  List<String> bioWriterKeywordsList = [];
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;
  String selectedToneId = "1";
  String selectedTone = "Third Person";
  Map<String, String> bioWriterToneMap = {
    "Third Person": '1',
    "First Person": '2',
  };
  void DisposeAll() {
    bioWriterAboutController.dispose();
    bioWriterCompanyNameController.dispose();
    bioWriterTargetAudienceController.dispose();
    bioWriterBrandController.dispose();
  }

  void bioWriterTone(String tone) {
    selectedTone = tone;
    selectedToneId = bioWriterToneMap[tone] ?? '1';
    notifyListeners();
  }

  void addItemToList(String etiket, BuildContext context) {
    bioWriterKeywordsList.add(etiket);
    notifyListeners();
  }

  void removeInterest(String etiket) {
    bioWriterKeywordsList.remove(etiket);
    notifyListeners();
  }

  void animateContainer(BuildContext context) {
    selectedDrafts = !selectedDrafts;
    notifyListeners();
  }

  BioWriterModel dataModel = BioWriterModel();
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

  List<BioWriterModel> listDataModel = [];
  List<String> totalList = [];
  Future postTransactions({
    required String object,
    required String companyName,
    required String keywords,
    required String viewId,
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
        "object": object,
        "company_name": companyName,
        "keywords": keywords,
        "view_id": viewId,
        "audience": audience ?? "",
        "brand": brand ?? "",
      },
    );

    if (response.result!) {
      // Work
      // dataModel = response;
      for (var element in response.data!.bios!) {
        totalList.add(element.bio!);
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
