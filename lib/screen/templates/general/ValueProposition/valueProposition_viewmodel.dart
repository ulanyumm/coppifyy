import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/templates/general/ValueProposition/valueProposition_model.dart';
import 'package:hypotenuse/screen/templates/general/ValueProposition/valueProposition_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ValuePropositionViewModel extends ChangeNotifier {
  ValuePropositionService service = ValuePropositionService();
  TextEditingController product = TextEditingController();
  TextEditingController companyproductDescription = TextEditingController();
  TextEditingController targetAudience = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey formkey = GlobalKey();
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;
  bool selectedDrafts = false;

  String selectedToneId = "1";
  String selectedTone = "Conversational";
  Map<String, String> valuePropositionToneMap = {
    "Conversational": '1',
    "Enthusiatic": '2',
    "Humorous": '3',
    "Professional": '4',
  };
  void DisposeAll() {
    product.dispose();
    companyproductDescription.dispose();
    targetAudience.dispose();
  }

  void valuePropositionTone(String tone) {
    selectedTone = tone;
    selectedToneId = valuePropositionToneMap[tone] ?? '1';
    notifyListeners();
  }

  void animateContainer(BuildContext context) {
    selectedDrafts = !selectedDrafts;
    notifyListeners();
  }

  bool isActiveButton = false;
  checkActiveButton() {
    if (product.text.isNotEmpty) {
      isActiveButton = true;
      print("active ");
    } else {
      print("passive ");
      isActiveButton = false;
    }
    notifyListeners();
  }

  void removeWidgetIndex(int index) {
    if (index >= 0 && index < totalList.length) {
      totalList.removeAt(index);
      notifyListeners();
    }
  }

  ValuePropositionModel valuepromodel = ValuePropositionModel();
  List<ValuePropositionModel> listDataModel = [];
  List<String> totalList = [];
  Future postTransactions({
    required String productname,
    required String productDescription,
    required String toneId,
    String? audience,
  }) async {
    isLoading = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;

    Map<String, dynamic> requestBody = {
      "product": productname,
      "description": productDescription,
      "audience": audience ?? "",
      "tone_id": toneId,
    };

    final response = await service.valuePropositionService(token, requestBody);

    if (response.result!) {
      // Başarılı senaryo
      //  valuepromodel = response;
      for (var element in response.data!.descriptions!) {
        totalList.add(element.description!);
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
