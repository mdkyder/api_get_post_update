// To parse this JSON data, do
//
//     final getPostModel = getPostModelFromJson(jsonString);

import 'dart:convert';

List<GetPostModel> getPostModelFromJson(String str) => List<GetPostModel>.from(json.decode(str).map((x) => GetPostModel.fromJson(x)));

String getPostModelToJson(List<GetPostModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetPostModel {
  int? id;
  String? slug;
  String? url;
  String? title;
  String? content;
  String? image;
  String? thumbnail;
  String? status;
  String? category;
  String? publishedAt;
  String? updatedAt;
  int? userId;

  GetPostModel({
    this.id,
    this.slug,
    this.url,
    this.title,
    this.content,
    this.image,
    this.thumbnail,
    this.status,
    this.category,
    this.publishedAt,
    this.updatedAt,
    this.userId,
  });

  factory GetPostModel.fromJson(Map<String, dynamic> json) => GetPostModel(
    id: json["id"],
    slug: json["slug"],
    url: json["url"],
    title: json["title"],
    content: json["content"],
    image: json["image"],
    thumbnail: json["thumbnail"],
    status: json["status"],
    category: json["category"],
    publishedAt: json["publishedAt"],
    updatedAt: json["updatedAt"],
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "url": url,
    "title": title,
    "content": content,
    "image": image,
    "thumbnail": thumbnail,
    "status": status,
    "category": category,
    "publishedAt": publishedAt,
    "updatedAt": updatedAt,
    "userId": userId,
  };
}
