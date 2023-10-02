import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';
import 'package:hypotenuse/screen/templates/ads&social/LinkedinPost/linkedinPostModel.dart';

class CopifyServiceLinkednPost {
  Future<LinkedinPostModel> postservice(
      String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        linkedinPostUrl,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: model,
    );

    print("response : ${response.body}");

    return LinkedinPostModel.fromJson(jsonDecode(response.body));
  }
}
