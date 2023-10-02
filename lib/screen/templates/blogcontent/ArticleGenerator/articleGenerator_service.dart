import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';
import 'package:hypotenuse/screen/templates/blogcontent/ArticleGenerator/articleGenerator_model.dart';

class CopifyServiceArticleGenerator {
  Future<ArticleGeneratorModel> postService(
      String token, Map<String, dynamic> requestBody) async {
    final response = await http.post(
      Uri.parse(articleGeneratorPostUrl),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": "Bearer $token",
      },
      body: json.encode(requestBody),
    );
    print(response.body);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return ArticleGeneratorModel.fromJson(responseData);
    } else {
      throw Exception('Failed to post article');
    }
  }
}
