import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';
import 'package:hypotenuse/screen/templates/site/LandingPageContent/landingPage_model.dart';

class CopifyServiceLandingPage {
  Future<LandingPageModel> postservice(
      String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        landingPagePostUrl,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: model,
    );

    print("response : ${response.body}");

    return LandingPageModel.fromJson(jsonDecode(response.body));
  }
}
