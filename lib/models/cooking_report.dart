class CookingReport {
  Data? data;

  CookingReport({this.data});

  CookingReport.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  double? rateAverage;
  num? star;
  int? totalReportCount;
  List<ListChild>? list;

  Data({this.rateAverage, this.star, this.totalReportCount, this.list});

  Data.fromJson(Map<String, dynamic> json) {
    rateAverage = json['rate_average'];
    star = json['star'];
    totalReportCount = json['total_report_count'];
    if (json['list'] != null) {
      list = <ListChild>[];
      json['list'].forEach((v) {
        list!.add(ListChild.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rate_average'] = rateAverage;
    data['star'] = star;
    data['total_report_count'] = totalReportCount;
    if (list != null) {
      data['list'] = list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListChild {
  String? id;
  String? recipeId;
  String? imageUrl;
  String? comment;
  int? rate;
  int? likesCount;
  String? postedAt;
  bool? liked;
  int? state;
  String? updatedAt;
  String? createdAt;
  User? user;
  UserProfile? userProfile;
  // Null? reply;

  ListChild({
    this.id,
    this.recipeId,
    this.imageUrl,
    this.comment,
    this.rate,
    this.likesCount,
    this.postedAt,
    this.liked,
    this.state,
    this.updatedAt,
    this.createdAt,
    this.user,
    this.userProfile,
    // this.reply
  });

  ListChild.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    recipeId = json['recipe_id'];
    imageUrl = json['image_url'];
    comment = json['comment'];
    rate = json['rate'];
    likesCount = json['likes_count'];
    postedAt = json['posted_at'];
    liked = json['liked'];
    state = json['state'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    userProfile = json['user_profile'] != null
        ? UserProfile.fromJson(json['user_profile'])
        : null;
    // reply = json['reply'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['recipe_id'] = recipeId;
    data['image_url'] = imageUrl;
    data['comment'] = comment;
    data['rate'] = rate;
    data['likes_count'] = likesCount;
    data['posted_at'] = postedAt;
    data['liked'] = liked;
    data['state'] = state;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (userProfile != null) {
      data['user_profile'] = userProfile!.toJson();
    }
    // data['reply'] = reply;
    return data;
  }
}

class User {
  String? id;
  bool? hasName;
  String? name;
  bool? hasImage;
  String? imageUrl;
  String? zipCode;
  String? addressCityName;
  String? email;
  bool? agreeToUseEmail;
  String? token;
  bool? linkFacebook;
  bool? linkLine;
  bool? linkTwitter;
  bool? linkEmail;
  bool? linkDocomo;
  bool? linkSoftbank;
  bool? linkAu;
  bool? linkApple;
  String? createdAt;

  User(
      {this.id,
      this.hasName,
      this.name,
      this.hasImage,
      this.imageUrl,
      this.zipCode,
      this.addressCityName,
      this.email,
      this.agreeToUseEmail,
      this.token,
      this.linkFacebook,
      this.linkLine,
      this.linkTwitter,
      this.linkEmail,
      this.linkDocomo,
      this.linkSoftbank,
      this.linkAu,
      this.linkApple,
      this.createdAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hasName = json['has_name'];
    name = json['name'];
    hasImage = json['has_image'];
    imageUrl = json['image_url'];
    zipCode = json['zip_code'];
    addressCityName = json['address_city_name'];
    email = json['email'];
    agreeToUseEmail = json['agree_to_use_email'];
    token = json['token'];
    linkFacebook = json['link_facebook'];
    linkLine = json['link_line'];
    linkTwitter = json['link_twitter'];
    linkEmail = json['link_email'];
    linkDocomo = json['link_docomo'];
    linkSoftbank = json['link_softbank'];
    linkAu = json['link_au'];
    linkApple = json['link_apple'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['has_name'] = hasName;
    data['name'] = name;
    data['has_image'] = hasImage;
    data['image_url'] = imageUrl;
    data['zip_code'] = zipCode;
    data['address_city_name'] = addressCityName;
    data['email'] = email;
    data['agree_to_use_email'] = agreeToUseEmail;
    data['token'] = token;
    data['link_facebook'] = linkFacebook;
    data['link_line'] = linkLine;
    data['link_twitter'] = linkTwitter;
    data['link_email'] = linkEmail;
    data['link_docomo'] = linkDocomo;
    data['link_softbank'] = linkSoftbank;
    data['link_au'] = linkAu;
    data['link_apple'] = linkApple;
    data['created_at'] = createdAt;
    return data;
  }
}

class UserProfile {
  String? id;
  bool? hasName;
  String? name;
  bool? hasImage;
  String? imageUrl;

  UserProfile({this.id, this.hasName, this.name, this.hasImage, this.imageUrl});

  UserProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hasName = json['has_name'];
    name = json['name'];
    hasImage = json['has_image'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['has_name'] = hasName;
    data['name'] = name;
    data['has_image'] = hasImage;
    data['image_url'] = imageUrl;
    return data;
  }
}
