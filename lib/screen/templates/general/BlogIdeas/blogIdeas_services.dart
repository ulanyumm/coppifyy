import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';
import 'blogIdeas_model.dart';

class BlogIdeasService {
  Future<BlogIdeasModel> blogIdeasService(
      String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        blogIdeasPostUrl,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: model,
    );

    print("response : ${response.body}");

    return BlogIdeasModel.fromJson(jsonDecode(response.body));
  }
}
