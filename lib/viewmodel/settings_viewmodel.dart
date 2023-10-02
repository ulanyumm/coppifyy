import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/model/showAuth_model.dart';
import 'package:hypotenuse/screen/auth/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreenViewModel extends ChangeNotifier {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  TextEditingController mailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  final AuthService _service = AuthService();
  Map<String, dynamic> outPoutList = {
    "English": 1,
    "French": 2,
    "German": 3,
    "Hindi": 4,
    "Italian": 5,
    "Japanese": 6,
    "Korean": 7,
    "Portuguese": 8,
    "Russian": 9,
    "Spanish": 10,
    "Turkish": 11,
  };

  ShowAuthModel showAuthModel = ShowAuthModel();

  String selectOutpout = 'English';
  int selectOutpoutid = 1;
  void updateSelectOutpoutLanguage(String language) {
    selectOutpoutid = outPoutList[language];
    selectOutpout = language;
    notifyListeners();
  }

  Map<String, dynamic> inputList = {
    "English": 1,
    "French": 2,
    "German": 3,
    "Hindi": 4,
    "Italian": 5,
    "Japanese": 6,
    "Korean": 7,
    "Portuguese": 8,
    "Russian": 9,
    "Spanish": 10,
    "Turkish": 11,
  };
  bool isEmailVerified(Map<String, dynamic> userData) {
    if (userData != null && userData is Map<String, dynamic>) {
      final emailVerified = userData['emailVerified'] as bool?;
      return emailVerified == true;
    }
    return false;
  }

  String selectInput = "English";
  int selectInputid = 1;
  void updateSelectInputLanguage(String language) {
    selectInputid = inputList[language];
    selectInput = language;
    notifyListeners();
  }

  Future saveChanges() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $token'
    };
    var request =
        http.Request('PUT', Uri.parse('https://api.copify.ai/api/auth/update'));
    request.bodyFields = {
      'input_language_id': selectInputid.toString(),
      'output_language_id': selectOutpoutid.toString(),
      'credit': '240'
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future showUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;

    final response = await _service.showUser(token);

    if (response.result!) {
      showAuthModel = response;
      notifyListeners();
    } else {}
  }
}
