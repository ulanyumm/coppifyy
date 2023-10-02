import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';
import 'package:hypotenuse/screen/templates/site/SocialMediaBioWriters/socialMediaBio_model.dart';

class CopifyServiceSocialBio {
  Future<SocialBioWritersModel> postservice(
      String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        socialMediaPostUrl,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: model,
    );

    print("response : ${response.body}");

    return SocialBioWritersModel.fromJson(jsonDecode(response.body));
  }
}
