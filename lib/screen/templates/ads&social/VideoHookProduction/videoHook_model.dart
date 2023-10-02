class VideoHookModel {
  bool? result;
  Data? data;
  String? videoTopic;
  String? keywords;
  String? toneId;
  String? audience;
  String? brand;

  VideoHookModel({
    this.result,
    this.data,
    this.videoTopic,
    this.keywords,
    this.toneId,
    this.audience,
    this.brand,
  });

  VideoHookModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['video_topic'] = videoTopic;
    data['keywords'] = keywords;
    data['tone_id'] = toneId;
    data['audience'] = audience;
    data['brand'] = brand;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? remainingCredit;
  List<VideoHooks>? videoHooks;

  Data({this.remainingCredit, this.videoHooks});

  Data.fromJson(Map<String, dynamic> json) {
    remainingCredit = json['remaining_credit'];
    if (json['video_hooks'] != null) {
      videoHooks = <VideoHooks>[];
      json['video_hooks'].forEach((v) {
        videoHooks!.add(VideoHooks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['remaining_credit'] = remainingCredit;
    if (videoHooks != null) {
      data['video_hooks'] = videoHooks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VideoHooks {
  int? id;
  int? videoHookId;
  VideoHook? videoHook;

  VideoHooks({this.id, this.videoHookId, this.videoHook});

  VideoHooks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    videoHookId = json['video_hook_id'];
    videoHook = json['video_hook'] != null
        ? VideoHook.fromJson(json['video_hook'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['video_hook_id'] = videoHookId;
    if (videoHook != null) {
      data['video_hook'] = videoHook!.toJson();
    }
    return data;
  }
}

class VideoHook {
  String? hook;
  String? introduction;

  VideoHook({this.hook, this.introduction});

  VideoHook.fromJson(Map<String, dynamic> json) {
    hook = json['hook'];
    introduction = json['introduction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hook'] = hook;
    data['introduction'] = introduction;
    return data;
  }
}
