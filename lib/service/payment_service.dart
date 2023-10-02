import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';
import 'package:hypotenuse/model/payment_model.dart';
import 'package:hypotenuse/model/plansId_model.dart';
import 'package:hypotenuse/model/plansProduct_model.dart';

class CopifyServicePaymentService {
  Future<PaymentPageModel> postservice(
      String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        paymentPostUrl,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: model,
    );

    print("response : ${response.body}");

    return PaymentPageModel.fromJson(jsonDecode(response.body));
  }

  Future<PaymentsUpdateModel> postUpdateService(
      String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        paymentUpdateUrl,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: model,
    );

    print("response : ${response.body}");

    return PaymentsUpdateModel.fromJson(jsonDecode(response.body));
  }

  Future<PlansProductModel> getProductPost(String token) async {
    final response = await http.get(
      Uri.parse(paymentProduct),
      headers: {
        "Authorization": "Bearer $token",
        "Accept": "application/json",
      },
    );

    return PlansProductModel.fromJson(jsonDecode(response.body));
  }
}
