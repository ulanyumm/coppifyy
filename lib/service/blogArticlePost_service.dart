import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';
import 'package:hypotenuse/model/blog%20Article/blogArticleOutlineCreate_model.dart';
import 'package:hypotenuse/model/blog%20Article/blogArticlePost_model.dart';
import 'package:hypotenuse/model/blog%20Article/blogArticleProject_model.dart';
import 'package:hypotenuse/model/blog%20Article/blogArticleTitle_Model.dart';

class CopifyServiceBlogArticleGenerator {
  Future<BlogArticleProjectModel> projectService(
      String token, BlogArticleProjectModel model) async {
    final response = await http.post(
      Uri.parse(
        blogArticleProjectUrl,
      ),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        "Authorization": "Bearer $token",
      },
      body: json.encode(model),
    );

    print("response : ${response.body}");

    return BlogArticleProjectModel.fromJson(jsonDecode(response.body));
  }

  Future<BlogArticleTitleModel> titleService(
      String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        blogArticleTitleUrl,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: json.encode(model),
    );

    print("response : ${response.body}");

    return BlogArticleTitleModel.fromJson(jsonDecode(response.body));
  }

  Future<BlogArticleOutlineCreateModel> createOutlineService(
      String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        blogArticleOutlineCreateUrl,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: json.encode(model),
    );

    print("response : ${response.body}");

    return BlogArticleOutlineCreateModel.fromJson(jsonDecode(response.body));
  }

  Future<BlogArticleOutlineCreateModel> outlineAddService(
      String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        blogArticleOutlineAddUrl,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: json.encode(model),
    );

    print("response : ${response.body}");

    return BlogArticleOutlineCreateModel.fromJson(jsonDecode(response.body));
  }

  Future<BlogArticlePostModel> postService(
      String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        blogArticlePostUrl,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: json.encode(model),
    );

    print("response : ${response.body}");

    return BlogArticlePostModel.fromJson(jsonDecode(response.body));
  }
}
