import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';
import 'package:hypotenuse/screen/templates/ads&social/InstagramCaptions/instagram_post_model.dart';

class InstagramService {
  Future<InstagramPostModel> instaPost(
      String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        instaPostUrl,
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
