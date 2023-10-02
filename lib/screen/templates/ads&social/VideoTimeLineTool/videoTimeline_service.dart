import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';

import 'videoTimeline_model.dart';

class CopifyServiceVideoTimeline {
  Future<VideoTimelineModel> postservice(
      String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        videoTimelinePostUrl,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: model,
    );

    print("response : ${response.body}");

    return VideoTimelineModel.fromJson(jsonDecode(response.body));
  }
}
