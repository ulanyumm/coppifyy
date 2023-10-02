import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';
import 'package:hypotenuse/screen/templates/ads&social/YoutubeTitlesDescriptions/youtubePost_model.dart';

class CopifyServiceYoutubePost {
  Future<YoutubePostModel> postservice(
      String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        youtubePostUrl,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: model,
    );

    print("response : ${response.body}");

    return YoutubePostModel.fromJson(jsonDecode(response.body));
  }
}
