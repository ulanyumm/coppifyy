class LinkedinPostModel {
  bool? result;
  Data? data;
  String? postContent;
  String? keywords;
  String? toneId;
  String? audience;
  String? companyName;

  LinkedinPostModel({
    this.result,
    this.data,
    this.postContent,
    this.keywords,
    this.toneId,
    this.audience,
    this.companyName,
  });

  LinkedinPostModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['post_content'] = postContent;
    data['keywords'] = keywords;
    data['tone_id'] = toneId;
    data['audience'] = audience;
    data['company_name'] = companyName;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? remainingCredit;
  List<LinkedinPosts>? linkedinPosts;

  Data({this.remainingCredit, this.linkedinPosts});

  Data.fromJson(Map<String, dynamic> json) {
    remainingCredit = json['remaining_credit'];
    if (json['linkedin_posts'] != null) {
      linkedinPosts = <LinkedinPosts>[];
      json['linkedin_posts'].forEach((v) {
        linkedinPosts!.add(LinkedinPosts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['remaining_credit'] = remainingCredit;
    if (linkedinPosts != null) {
      data['linkedin_posts'] =
          linkedinPosts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LinkedinPosts {
  int? id;
  int? linkedinPostId;
  String? linkedinPost;

  LinkedinPosts({this.id, this.linkedinPostId, this.linkedinPost});

  LinkedinPosts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    linkedinPostId = json['linkedin_post_id'];
    linkedinPost = json['linkedin_post'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['linkedin_post_id'] = linkedinPostId;
    data['linkedin_post'] = linkedinPost;
    return data;
  }
}
