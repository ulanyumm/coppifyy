import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';
import 'twitterPost_model.dart';

class CopifyServiceTwitterPost {
  Future<TwitterPostModel> postservice(
      String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        twitterPostUrl,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: model,
    );

    print("response : ${response.body}");

    return TwitterPostModel.fromJson(jsonDecode(response.body));
  }
}
