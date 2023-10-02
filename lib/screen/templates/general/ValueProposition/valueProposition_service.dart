import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';
import 'package:hypotenuse/screen/templates/general/ValueProposition/valueProposition_model.dart';

class ValuePropositionService {
  Future<ValuePropositionModel> valuePropositionService(
      String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        valuePropositionPostUrl,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: model,
    );

    print("response : ${response.body}");

    return ValuePropositionModel.fromJson(jsonDecode(response.body));
  }
}
