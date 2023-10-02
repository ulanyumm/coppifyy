import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';
import 'package:hypotenuse/screen/templates/ads&social/GoogleAds/googlepost_model.dart';

class GooglePostService {
  Future<GooglePostModel> postservice(
      String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        googleAdsPostUrl,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: model,
    );

    print("response : ${response.body}");

    return GooglePostModel.fromJson(jsonDecode(response.body));
  }
}
