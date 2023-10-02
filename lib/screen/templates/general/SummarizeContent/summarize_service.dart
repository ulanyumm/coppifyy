import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';
import 'package:hypotenuse/screen/templates/general/SummarizeContent/summarize_model.dart';

class SummarizeService {
  Future<SummarizeContentModel> summmarizePost(
      String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        summarizeContentPostUrl,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: model,
    );

    print("response : ${response.body}");

    return SummarizeContentModel.fromJson(jsonDecode(response.body));
  }
}
