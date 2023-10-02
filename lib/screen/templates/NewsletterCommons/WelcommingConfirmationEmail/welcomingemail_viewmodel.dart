import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/templates/NewsletterCommons/WelcommingConfirmationEmail/welcomming_model.dart';
import 'package:hypotenuse/screen/templates/NewsletterCommons/WelcommingConfirmationEmail/welcoming_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomingConfirmationEmailViewModel extends ChangeNotifier {
  CopifyServiceWelcommingPost service = CopifyServiceWelcommingPost();
  TextEditingController welcomingProductController = TextEditingController();
  TextEditingController welcomingDescriptionController =
      TextEditingController();
  TextEditingController beneftsController = TextEditingController();
  TextEditingController captionsEditController = TextEditingController();
  bool isButtonActive = false;
  bool isGenerateAvailable = false;
  bool isCaptionChanged = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey welcomeEmailFormKey = GlobalKey();

  bool isLoading = false;
  bool isDataLoaded = false;
  bool isDataAvailable = false;

  void DisposeAll() {
    welcomingProductController.dispose();
    welcomingDescriptionController.dispose();
    beneftsController.dispose();
  }

  WelcommingModel dataModel = WelcommingModel();
  void removeWidgetIndex(int index) {
    if (index >= 0 && index < totalList.length) {
      totalList.removeAt(index);
      notifyListeners();
    }
  }

  void isButtonActiveFunc(String productText, String descriptionText) {
    isButtonActive = productText.isNotEmpty && descriptionText.isNotEmpty;

    print("text : $productText");

    notifyListeners();
  }

  checkAvailable(bool available) {
    isGenerateAvailable = available;
    notifyListeners();
  }

  List<WelcommingModel> listDataModel = [];
  List<String> totalList = [];
  Future postTransactions({
    required String product,
    required String description,
    required String benefits,
  }) async {
    isLoading = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    final response = await service.postservice(
      token,
      {
        "product": product,
        "description": description,
        "benefits": benefits,
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
