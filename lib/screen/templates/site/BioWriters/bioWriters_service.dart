import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';
import 'package:hypotenuse/screen/templates/site/BioWriters/bioWriters_model.dart';

class CopifyServiceBioWriter {
  Future<BioWriterModel> postservice(
      String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        bioWriterPostUrl,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: model,
    );

    print("response : ${response.body}");

    return BioWriterModel.fromJson(jsonDecode(response.body));
  }
}
