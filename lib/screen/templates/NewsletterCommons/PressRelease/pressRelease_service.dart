import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';
import 'package:hypotenuse/screen/templates/NewsletterCommons/PressRelease/pressRelease_model.dart';

class CopifyServicePressRelease {
  Future<PressReleaseModel> postservice(
      String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        pressReleasePostUrl,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: model,
    );

    print("response : ${response.body}");

    return PressReleaseModel.fromJson(jsonDecode(response.body));
  }
}
