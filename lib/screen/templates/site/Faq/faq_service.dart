import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';
import 'package:hypotenuse/screen/templates/site/Faq/faq_model.dart';

class CopifyServiceFaq {
  Future<FaqModel> postservice(String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        faqPostUrl,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: model,
    );

    print("response : ${response.body}");

    return FaqModel.fromJson(jsonDecode(response.body));
  }
}
