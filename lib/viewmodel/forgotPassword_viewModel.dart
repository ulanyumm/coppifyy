import 'package:flutter/cupertino.dart';
import 'package:hypotenuse/model/forgotPassword_model.dart';
import 'package:hypotenuse/screen/auth/auth_service.dart';

class ForgotPasswordViewModel extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  AuthService service = AuthService();
  bool isLoading = false;
  bool isDataAvailable = false;
  bool isActiveButton = false;
  ForgotPasswordModel dataModel = ForgotPasswordModel();

  void isActivebuttonFunc(String email) {
    isActiveButton = emailController.text.isNotEmpty;
    notifyListeners();
  }

  Future postTransiction({
    required String? email,
  }) async {
    isLoading = true;
    notifyListeners();
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String token = prefs.getString("token")!;

    Map<String, dynamic> requestBody = {
      "email": email,
    };

    final response = await service.forgotPassword(requestBody);

    if (response.result!) {
      // Başarılı senaryo
      dataModel = response;
      isDataAvailable = true;
    } else {
      // Hata senaryosu
      isDataAvailable = false;
    }

    isLoading = false;
    notifyListeners();
  }
}
