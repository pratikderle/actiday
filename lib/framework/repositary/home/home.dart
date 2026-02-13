import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  List<Banner>? banner;
  List<Category>? categories;
  List<TopClass>? topClass;

  Welcome({
    this.banner,
    this.categories,
    this.topClass,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    banner: json["banner"] == null ? [] : List<Banner>.from(json["banner"]!.map((x) => Banner.fromJson(x))),
    categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
    topClass: json["top_class"] == null ? [] : List<TopClass>.from(json["top_class"]!.map((x) => TopClass.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "banner": banner == null ? [] : List<dynamic>.from(banner!.map((x) => x.toJson())),
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
    "top_class": topClass == null ? [] : List<dynamic>.from(topClass!.map((x) => x.toJson())),
  };
}

class Banner {
  String? bannerId;
  String? image;
  String? bannerTitle;
  String? bannerSubTitle;

  Banner({
    this.bannerId,
    this.image,
    this.bannerTitle,
    this.bannerSubTitle,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    bannerId: json["banner_id"],
    image: json["image"],
    bannerTitle: json["banner_title"],
    bannerSubTitle: json["banner_sub_title"],
  );

  Map<String, dynamic> toJson() => {
    "banner_id": bannerId,
    "image": image,
    "banner_title": bannerTitle,
    "banner_sub_title": bannerSubTitle,
  };
}

class Category {
  String? categoryId;
  String? image;
  String? categoryName;

  Category({
    this.categoryId,
    this.image,
    this.categoryName,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    categoryId: json["category_id"],
    image: json["image"],
    categoryName: json["category_name"],
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "image": image,
    "category_name": categoryName,
  };
}

class TopClass {
  String? id;
  String? image;
  bool? isFavourite;
  String? title;
  String? subTitle;
  String? address;
  String? distance;
  int? rating;

  TopClass({
    this.id,
    this.image,
    this.isFavourite,
    this.title,
    this.subTitle,
    this.address,
    this.distance,
    this.rating,
  });

  factory TopClass.fromJson(Map<String, dynamic> json) => TopClass(
    id: json["id"],
    image: json["image"],
    isFavourite: json["is_favourite"],
    title: json["title"],
    subTitle: json["sub_title"],
    address: json["address"],
    distance: json["distance"],
    rating: json["rating"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "is_favourite": isFavourite,
    "title": title,
    "sub_title": subTitle,
    "address": address,
    "distance": distance,
    "rating": rating,
  };
}
