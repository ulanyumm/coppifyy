import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';
import 'package:hypotenuse/screen/templates/ads&social/FacebookAds/facebookAds_model.dart';

class FacebookAdsService {
  Future<FacebookAdsModel> facebookAdsservice(
      String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        facebookAdsPostUrl,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: model,
    );

    print("response : ${response.body}");

    return FacebookAdsModel.fromJson(jsonDecode(response.body));
  }
}
