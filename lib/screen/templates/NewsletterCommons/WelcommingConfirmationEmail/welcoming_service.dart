import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';
import 'package:hypotenuse/screen/templates/NewsletterCommons/WelcommingConfirmationEmail/welcomming_model.dart';

class CopifyServiceWelcommingPost {
  Future<WelcommingModel> postservice(
      String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        welcommingEmailPostUrl,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: model,
    );

    print("response : ${response.body}");

    return WelcommingModel.fromJson(jsonDecode(response.body));
  }
}
