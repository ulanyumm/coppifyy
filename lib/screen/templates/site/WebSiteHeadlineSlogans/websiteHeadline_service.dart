import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';
import 'package:hypotenuse/screen/templates/site/WebSiteHeadlineSlogans/websiteHeadline_model.dart';

class CopifyServiceWebsiteHeadline {
  Future<WebsiteHeadlineModel> postservice(
      String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        websiteHeadlinePostUrl,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: model,
    );

    print("response : ${response.body}");

    return WebsiteHeadlineModel.fromJson(jsonDecode(response.body));
  }
}
