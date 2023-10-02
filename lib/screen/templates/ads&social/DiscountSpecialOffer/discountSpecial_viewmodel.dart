import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/templates/ads&social/DiscountSpecialOffer/discountOffer_model.dart';
import 'package:hypotenuse/screen/templates/ads&social/DiscountSpecialOffer/discountOffer_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DiscountSpecialViewModel extends ChangeNotifier {
  CopifyServiceDiscount service = CopifyServiceDiscount();
  TextEditingController discountPurpose = TextEditingController();
  TextEditingController discountProduct = TextEditingController();
  TextEditingController discountProductDescription = TextEditingController();
  TextEditingController discountSpecialOffer = TextEditingController();
  TextEditingController discountClaim = TextEditingController();

  TextEditingController captionsEditController = TextEditingController();
  bool selectedDrafts = false;
  bool isGenerateAvailable = false;
  bool isCaptionChanged = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey discountPostFormkey = GlobalKey();
  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;
  String selectedToneId = "1";
  String selectedTone = "Conversational";
  Map<String, String> discountToneMap = {
    "Conversational": '1',
    "Enthusiatic": '2',
    "Humorous": '3',
    "Professional": '4',
  };
  void DisposeAll() {
    discountPurpose.dispose();
    discountProduct.dispose();
    discountProductDescription.dispose();
    discountSpecialOffer.dispose();
    discountClaim.dispose();
  }

  void discountTone(String tone) {
    selectedTone = tone;
    selectedToneId = discountToneMap[tone] ?? '1';
    notifyListeners();
  }

  bool isActiveButton = false;
  checkActiveButton() {
    if (discountPurpose.text.isNotEmpty &&
        discountProduct.text.isNotEmpty &&
        discountProductDescription.text.isNotEmpty &&
        discountClaim.text.isNotEmpty) {
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

  DiscountPostModel discountModel = DiscountPostModel();

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

  List<DiscountPostModel> listDataModel = [];
  List<String> totalList = [];
  Future postTransactions(
    BuildContext context, {
    required String product,
    required String want,
    required String description,
    required String toneId,
    String? way,
  }) async {
    isLoading = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    final response = await service.postservice(
      token,
      {
        "product": product,
        "want": want,
        "description": description,
        "tone_id": toneId,
        "way": way ?? "",
      },
    );

    if (response.result!) {
      // Work
      // discountModel = response;
      for (var element in response.data!.promotions!) {
        totalList.add(element.post!);
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
