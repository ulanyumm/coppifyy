import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:hypotenuse/constants/api_constant.dart';
import 'package:hypotenuse/model/copiImage_model.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

class CopifyServiceCopiImage {
  Future<CopiImageModel> postService(
      String token, Map<String, dynamic> model) async {
    final response = await http.post(
      Uri.parse(
        imageGeneratorPostUrl,
      ),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: model,
    );

    print("response : ${response.body}");

    return CopiImageModel.fromJson(jsonDecode(response.body));
  }

  Future<bool> downloadImage(String imageUrl) async {
    try {
      var response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        Directory directory = await getApplicationDocumentsDirectory();
        String filePath = '${directory.path}/image${DateTime.now().second}.jpg';
        File file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);
        final result = await ImageGallerySaver.saveFile(file.path);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
