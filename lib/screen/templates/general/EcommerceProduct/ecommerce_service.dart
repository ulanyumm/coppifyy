import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';
import 'package:hypotenuse/screen/templates/general/EcommerceProduct/ecommerce_model.dart';

class EcommerceProductService {
  Future<EcommerceProductModel> ecommercePost(
      String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        ecommercePostUrl,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: model,
    );

    print("response : ${response.body}");

    return EcommerceProductModel.fromJson(jsonDecode(response.body));
  }
}
