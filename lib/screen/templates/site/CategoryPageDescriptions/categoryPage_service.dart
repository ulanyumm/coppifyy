import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';
import 'package:hypotenuse/screen/templates/site/CategoryPageDescriptions/categoryPage_model.dart';

class CopifyServiceCategoryPage {
  Future<CategoryPageModel> postservice(
      String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        categoryPagePostUrl,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: model,
    );

    print("response : ${response.body}");

    return CategoryPageModel.fromJson(jsonDecode(response.body));
  }
}
