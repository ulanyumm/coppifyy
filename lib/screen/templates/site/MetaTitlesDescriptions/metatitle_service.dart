import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';
import 'package:hypotenuse/screen/templates/site/MetaTitlesDescriptions/metaTitle_model.dart';

class CopifyServiceMetatitle {
  Future<MetaTitleModel> postservice(
      String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        metaTitlePostUrl,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: model,
    );

    print("response : ${response.body}");

    return MetaTitleModel.fromJson(jsonDecode(response.body));
  }
}
