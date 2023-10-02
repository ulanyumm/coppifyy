import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';
import 'package:hypotenuse/screen/templates/ads&social/DiscountSpecialOffer/discountOffer_model.dart';

class CopifyServiceDiscount {
  Future<DiscountPostModel> postservice(
      String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        discountOfferPostUrl,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: model,
    );

    print("response : ${response.body}");

    return DiscountPostModel.fromJson(jsonDecode(response.body));
  }
}
