import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';
import 'package:hypotenuse/screen/templates/general/JobAdvertisement/jobAdvertisement_model.dart';

class JobAdvertisementService {
  Future<JobAdvertisementModel> jobAdverts(
      String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        jobAdvertisementPostUrl,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: model,
    );

    print("response : ${response.body}");

    return JobAdvertisementModel.fromJson(jsonDecode(response.body));
  }
}
