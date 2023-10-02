import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';
import 'package:hypotenuse/screen/templates/site/VisionStatement/visionStatement_model.dart';

class CopifyServiceVisionStatement {
  Future<VisionStatementModel> postservice(
      String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        visionStatementPostUrl,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: model,
    );

    print("response : ${response.body}");

    return VisionStatementModel.fromJson(jsonDecode(response.body));
  }
}
