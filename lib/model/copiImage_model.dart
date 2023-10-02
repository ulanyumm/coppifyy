class CopiImageModel {
  bool? result;
  Data? data;
  String? prompt;
  String? medium;
  String? mood;
  String? steps;
  String? style;

  CopiImageModel({
    this.result,
    this.data,
    this.prompt,
    this.medium,
    this.mood,
    this.steps,
    this.style,
  });

  CopiImageModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['prompt'] = prompt;
    data['medium'] = medium;
    data['mood'] = mood;
    data['steps'] = steps;
    data['style'] = style;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? remainingCredit;
  List<Images>? images;

  Data({this.remainingCredit, this.images});

  Data.fromJson(Map<String, dynamic> json) {
    remainingCredit = json['remaining_credit'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['remaining_credit'] = remainingCredit;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  int? id;
  int? productId;
  String? url;

  Images({this.id, this.productId, this.url});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['url'] = url;
    return data;
  }
}
