import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ZeminViewModel extends ChangeNotifier {
  bool likeColorChanged = false;
  bool unlikeColorChanged = false;
  void likeColorChangedFunc() {
    likeColorChanged = !likeColorChanged;
    notifyListeners();
  }

  void unlikeColorChangedFunc() {
    unlikeColorChanged = !unlikeColorChanged;
    notifyListeners();
  }

  /*   Future ActionMethod(
    int tip,
  ) async {
    if (tip == 1) {
      await CustomLike();
    } else if (tip == 2) {
      await CustomDisLike();
    } else if (tip == 3) {
      await CustomCopy(text!);
    } else {
      await CustomDelete(id);
    }
    notifyListeners();
  } */

  Future CustomDeleteAll(String tip) async {
    if (tip == "Google") {
      await ResetAllGoogle();
    } else if (tip == "Facebook") {
      await ResetAllFacebook();
    } else if (tip == "Linkedin") {
      await ResetAllLinkedin();
    } else if (tip == "Youtube") {
      await ResetAllYoutube();
    } else if (tip == "Linkedin") {
      await ResetAllLinkedin();
    } else if (tip == "Video Hook") {
      await ResetAllVideoHook();
    } else if (tip == "Instagram") {
      await ResetAllInstagram();
    } else if (tip == "Contest and Giveway") {
      await ResetAllContestGiveway();
    } else if (tip == "Summarize") {
      await ResetAllSummarize();
    } else if (tip == "Email Copy") {
      await ResetAllEmailCopy();
    } else if (tip == "Marketing Angles") {
      await ResetAllMarketingAngles();
    } else if (tip == "Ask Any Thing") {
      await ResetAllRewriting();
    } else if (tip == "Press Release") {
      await ResetAllPressRelease();
    } else if (tip == "Job Advertisement") {
      await ResetAllJobadvertisement();
    } else if (tip == "Discount Offer") {
      await ResetAllLinkedin();
    } else if (tip == "Ecommerce Product Description") {
      await ResetAllEcommerceProduct();
    } else if (tip == "Landing Page Content") {
      await ResetAllLandingPage();
    } else if (tip == "Category Page Descriptions") {
      await ResetAllCategoryPage();
    } else if (tip == "Meta Titles") {
      await ResetAllMetaTitles();
    } else if (tip == "Bio Writers") {
      await ResetAllBioWriter();
    } else if (tip == "Website Headline") {
      await ResetAllWebSiteHeadline();
    } else {
      await ResetAllTwitter();
    }
    notifyListeners();
  }

  Future CustomLike() async {
    return true;
  }

  Future CustomDisLike() async {
    return true;
  }

  Future CustomCopy(String text) async {
    Clipboard.setData(ClipboardData(text: text));
  }

  Future CustomDelete(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'DELETE',
        Uri.parse(
            'https://dev-api.copify.ai/api/facebook/delete/$id'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future ResetAllGoogle() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'DELETE', Uri.parse('https://dev-api.copify.ai/api/google/reset'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future ResetAllFacebook() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'DELETE', Uri.parse('https://dev-api.copify.ai/api/facebook/reset'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future ResetAllLinkedin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'DELETE', Uri.parse('https://dev-api.copify.ai/api/google/reset'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future ResetAllTwitter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'DELETE', Uri.parse('https://dev-api.copify.ai/api/google/reset'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future ResetAllYoutube() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'DELETE', Uri.parse('https://dev-api.copify.ai/api/youtube/reset'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future ResetAllVideoHook() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'DELETE', Uri.parse('https://dev-api.copify.ai/api/hook/reset'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future ResetAllInstagram() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'DELETE', Uri.parse('https://dev-api.copify.ai/api/insta/reset'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future ResetAllContestGiveway() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'DELETE', Uri.parse('https://dev-api.copify.ai/api/contest/reset'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future ResetAllSummarize() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'DELETE', Uri.parse('https://dev-api.copify.ai/api/summarize/reset'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future ResetAllEmailCopy() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'DELETE', Uri.parse('https://dev-api.copify.ai/api/mail/reset'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future ResetAllMarketingAngles() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'DELETE', Uri.parse('https://dev-api.copify.ai/api/marketing/reset'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future ResetAllAskAnyThing() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'DELETE', Uri.parse('https://dev-api.copify.ai/api/ask/reset'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future ResetAllRewriting() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'DELETE', Uri.parse('https://dev-api.copify.ai/api/rewriting/reset'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future ResetAllPressRelease() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'DELETE', Uri.parse('https://dev-api.copify.ai/api/press/reset'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future ResetAllJobadvertisement() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'DELETE', Uri.parse('https://dev-api.copify.ai/api/job/reset'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future ResetAllDiscountOffer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'DELETE', Uri.parse('https://dev-api.copify.ai/api/discount/reset'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future ResetAllEcommerceProduct() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'DELETE', Uri.parse('https://dev-api.copify.ai/api/description/reset'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future ResetAllLandingPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'DELETE', Uri.parse('https://dev-api.copify.ai/api/landing/reset'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future ResetAllCategoryPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'DELETE', Uri.parse('https://dev-api.copify.ai/api/category/reset'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future ResetAllMetaTitles() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'DELETE', Uri.parse('https://dev-api.copify.ai/api/meta/reset'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future ResetAllBioWriter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'DELETE', Uri.parse('https://dev-api.copify.ai/api/bio/reset'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future ResetAllWebSiteHeadline() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'DELETE', Uri.parse('https://dev-api.copify.ai/api/headline/reset'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
