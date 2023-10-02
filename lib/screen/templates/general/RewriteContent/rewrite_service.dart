import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';
import 'package:hypotenuse/screen/templates/general/RewriteContent/rewrite_model.dart';

class RewriteService {
  Future<RewriteModel> rewritePost(
      String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        rewriteContentPostUrl,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: model,
    );

    print("response : ${response.body}");

    return RewriteModel.fromJson(jsonDecode(response.body));
  }
}
