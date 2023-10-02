import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/templates/general/EcommerceProduct/ecommerce_model.dart';
import 'package:hypotenuse/screen/templates/general/EcommerceProduct/ecommerce_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EcommerceProductViewModel extends ChangeNotifier {
  EcommerceProductService service = EcommerceProductService();
  TextEditingController ecommerceProduct = TextEditingController();
  TextEditingController productDescription = TextEditingController();
  TextEditingController targetAudience = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey ecommerceFormKey = GlobalKey();
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;
  bool selectedDrafts = false;
  String selectedToneId = "1";
  String selectedTone = "Conversational";
  Map<String, String> ecommerceToneMap = {
    "Conversational": '1',
    "Enthusiatic": '2',
    "Humorous": '3',
    "Professional": '4',
  };
  void DisposeAll() {
    ecommerceProduct.dispose();
    productDescription.dispose();
    targetAudience.dispose();
  }

  void ecommerceTone(String tone) {
    selectedTone = tone;
    selectedToneId = ecommerceToneMap[tone] ?? '1';
    notifyListeners();
  }

  void animateContainer(BuildContext context) {
    selectedDrafts = !selectedDrafts;
    notifyListeners();
  }

  bool isActiveButton = false;
  checkActiveButton() {
    if (ecommerceProduct.text.isNotEmpty &&
        productDescription.text.isNotEmpty) {
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

  EcommerceProductModel ecommerceModel = EcommerceProductModel();
  List<EcommerceProductModel> listDataModel = [];
  List<String> totalList = [];
  Future ecommercePost({
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
      "product_name": productname,
      "product_description": productDescription,
      "audience": audience ?? "",
      "tone_id": toneId,
    };

    final response = await service.ecommercePost(token, requestBody);

    if (response.result!) {
      // Başarılı senaryo
      // ecommerceModel = response;
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
