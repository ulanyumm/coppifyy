import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';

import 'videoHook_model.dart';

class CopifyServiceVideoHook {
  Future<VideoHookModel> postservice(
      String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        videoHookPostUrl,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: model,
    );

    print("response : ${response.body}");

    return VideoHookModel.fromJson(jsonDecode(response.body));
  }
}
