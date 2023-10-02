import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';
import 'marketing_model.dart';

class CopifyserviceMarketing {
  Future<MarketingModel> postservice(
      String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        marketingPostUrl,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: model,
    );

    print("response : ${response.body}");

    return MarketingModel.fromJson(jsonDecode(response.body));
  }
}
