import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';
import 'package:hypotenuse/screen/templates/general/AskAIAnyThing/askAnything_model.dart';

class AskAnythingService {
  Future<AskAnyThingPostModel> askAnyPost(
      String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        askAnyThingPostUrl,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: model,
    );

    print("response : ${response.body}");

    return AskAnyThingPostModel.fromJson(jsonDecode(response.body));
  }
}
