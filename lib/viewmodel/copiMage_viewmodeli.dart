import 'package:flutter/material.dart';
import 'package:hypotenuse/model/copiImage_model.dart';
import 'package:hypotenuse/service/copiImage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CopiMageViewModel extends ChangeNotifier {
  CopifyServiceCopiImage service = CopifyServiceCopiImage();
  TextEditingController imageDescriptionController = TextEditingController();
  bool isDataAvailable = false;
  bool isLoading = false;
  bool isActiveButton = false;
  GlobalKey<ScaffoldState> copiMageScaffoldKey = GlobalKey();
  List<String> imageUrls = [];
  List<String> gpuStrength = ["Light", "Medium", "Hard", "Heavy", "Maximum"];

  Map<String, dynamic> styleList = {
    "3d Model": '3d-model',
    "Pixel Art": "pixel-art",
    "Comic Book": "comic-book",
    "Isometric": "isometric",
    "Analog Film": "analog-film",
    "Digital Art": "digital-art",
    "Line Art": "line-art",
    "Anime": "anime",
    "Enhance": "enhance",
    "Low Poly": "low-poly",
    "Cinematic": "cinematic",
    "Fantasy Art": "fantasy-art",
    "Modeling Compound": "modeling-compound",
    "Neon Punk": "neon-punk",
    "Origami": "origami",
    "Photographic": "photographic",
    "Tile Texture": "tile-texture"
  };

  List<String> imageMediumList = [
    "None",
    "Acrylcs",
    "Canvas",
    "Chalk",
    "Charcoal",
    "Classic Oil",
    "Crayon",
    "Glass",
    "Ink",
    "Modem Oil Painting",
    "Pastel",
    "Pencil",
    "Spray Paint",
    "Water Color Painting",
    "Wood Panel"
  ];
  List<String> imageMoodList = [
    "None",
    "Aggressive",
    "Angry",
    "Boring",
    "Calm",
    "Cheerfull",
    "Chilling",
    "Colorful",
    "Dark",
    "Neutural"
  ];
  String selectedStyleKey = "3d-model";
  String selectStrength = "Light";
  String selectStyle = "3d Model";
  String selectMedium = "None";
  String selectMood = "None";

  void updateSelectedStyle(String tone) {
    selectStyle = tone;
    selectedStyleKey = styleList[tone] ?? '3d-model';
    notifyListeners();
  }

  GlobalKey copiMageformkey = GlobalKey();

  void updateGpuStrength(String newStrength) {
    selectStrength = newStrength;
    notifyListeners();
  }

  void updateSelectedMedium(String newMedium) {
    selectMedium = newMedium;
    notifyListeners();
  }

  void updateSelectedMood(String newMood) {
    selectMood = newMood;
    notifyListeners();
  }

  void isButtonActiveFunc() {
    if (imageDescriptionController.text.isNotEmpty) {
      isActiveButton = true;
    } else {
      isActiveButton = false;
    }
    notifyListeners();
  }

  void fetchImages() {
    imageUrls = [
      "assets/images/image.png",
      "assets/images/image1.png",
      "assets/images/image2.png",
      "assets/images/image3.png",
    ];
  }

  CopiImageModel dataModel = CopiImageModel();

  Future downloadImage(String imagePath) async {
    isLoading = true;

    final response = await service.downloadImage(imagePath);

    if (response) {
      // Başarılı senaryo

      isLoading = false;
    } else {
      // Hata senaryosu
      isLoading = false;
    }
  }

  Future postTransiction(
      {required String prompt,
      required String aspectRatio,
      required String samples,
      String? medium,
      String? mood,
      String? style,
      String? steps}) async {
    isLoading = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;

    Map<String, dynamic> requestBody = {
      "prompt": prompt,
      "medium": medium ?? "",
      "mood": mood ?? "",
      "style": style ?? "",
      "steps": steps ?? "",
      "aspect_ratio": aspectRatio,
      "samples": samples,
    };

    final response = await service.postService(token, requestBody);

    if (response.result!) {
      // Başarılı senaryo
      dataModel = response;
      isDataAvailable = true;
      isLoading = false;
      notifyListeners();
    } else {
      // Hata senaryosu
      isLoading = false;
      notifyListeners();
    }
  }
}
