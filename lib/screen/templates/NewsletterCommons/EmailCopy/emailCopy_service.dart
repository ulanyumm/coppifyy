import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';
import 'package:hypotenuse/screen/templates/NewsletterCommons/EmailCopy/emailCopy_model.dart';

class CopifyServiceEmailCopy {
  Future<EmailCopyModel> postservice(
      String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        emailCopyPostUrl,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: model,
    );

    print("response : ${response.body}");

    return EmailCopyModel.fromJson(jsonDecode(response.body));
  }
}
