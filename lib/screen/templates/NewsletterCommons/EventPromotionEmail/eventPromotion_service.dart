import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';
import 'package:hypotenuse/screen/templates/NewsletterCommons/EventPromotionEmail/eventPromotion_model.dart';

class CopifyServiceEventPromotion {
  Future<EventPromotionModel> postservice(
      String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        eventPromotionPostUrl,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: model,
    );

    print("response : ${response.body}");

    return EventPromotionModel.fromJson(jsonDecode(response.body));
  }
}
