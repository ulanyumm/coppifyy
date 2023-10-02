import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';
import 'package:hypotenuse/screen/templates/ads&social/ContestGiveway/contestGiveway_service.dart';

class CopifyServiceContestPost {
  Future<ContestPostModel> postservice(
      String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        contestPostUrl,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: model,
    );

    print("response : ${response.body}");

    return ContestPostModel.fromJson(jsonDecode(response.body));
  }
}
