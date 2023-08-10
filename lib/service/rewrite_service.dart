import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';
import 'package:hypotenuse/model/instagram_post_model.dart';

class RewriteService {
  Future<InstagramPostModel> instaPost(
      String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        rewriteContentPostUrl,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: model,
    );

    print("response : ${response.body}");

    return InstagramPostModel.fromJson(jsonDecode(response.body));
  }
}
