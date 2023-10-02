import 'package:flutter/material.dart';
import 'package:hypotenuse/model/showAuth_model.dart';
import 'package:hypotenuse/screen/auth/auth_service.dart';
import 'package:hypotenuse/widgets/custom_alert_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends ChangeNotifier {
  AuthService service = AuthService();
  bool isChecked = false;
  bool isLoading = false;
  bool isDataAvailable = false;
  bool hidePassword = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /* Future<bool> canLogIn(BuildContext context) async {
    String? token = await getToken();
    if (token != null) {
      ShowAuthModel model = await service.showUser(token);
      if (model.result!) {
        return true;
      } else {
        return false;
      }
    } else {
      showMessage(context, "Başlangıçta hata oluştu");
      return false;
    }
  }
 */

  Future<bool> canLogIn(BuildContext context) async {
    String? token = await getToken();
    if (token != null) {
      ShowAuthModel model = await service.showUser(token);
      if (model.result!) {
        return true;
      } else {
        // Hata durumu: Snackbar gösterme
        return false;
      }
    } else {
      // Hata durumu: Snackbar gösterme
      return false;
    }
  }

  String? validateEmail(value) {
    if (value!.isEmpty) {
      return 'Please enter some text';
    }
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? lengthPassword(value) {
    if (value!.isEmpty) {
      return 'Password cannot be empty';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  void hidePasswordFunc() {
    hidePassword = !hidePassword;
    notifyListeners();
  }

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  // SharedPreferences işlemleri
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  // Token'i SharedPreferences'e kaydeden fonksiyon
  Future<void> saveTokenToSharedPreferences(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
  }

  Future<void> loadRememberMeStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _rememberMe = prefs.getBool('rememberMe') ?? false;
    notifyListeners();
  }

  bool _rememberMe = false;
  bool get rememberMe => _rememberMe;
  void toggleRememberMe() {
    _rememberMe = !_rememberMe;
    saveRememberMeStatus(_rememberMe); // Değişikliği kaydet
    notifyListeners();
  }

  Future<void> saveRememberMeStatus(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('rememberMe', status);
  }

  Future<bool> loginAuth(
    String email,
    String password,
  ) async {
    final response = await service.login({
      "email": email,
      "password": password,
    });

    if (response.result!) {
      String tokenCode = response.data!.token!.code!;
      await saveTokenToSharedPreferences(tokenCode);
      return true; // Başarılı girişi işaretle
    } else {
      return false; // Başarısız girişi işaretle
    }
  }
}
