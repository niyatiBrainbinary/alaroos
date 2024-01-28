// To parse this JSON data, do
//
//     final getAllPostModel = getAllPostModelFromJson(jsonString);

import 'dart:convert';

GetAllPostModel getAllPostModelFromJson(String str) => GetAllPostModel.fromJson(json.decode(str));

String getAllPostModelToJson(GetAllPostModel data) => json.encode(data.toJson());

class GetAllPostModel {
  bool? success;
  int? code;
  Data? data;

  GetAllPostModel({
    this.success,
    this.code,
    this.data,
  });

  factory GetAllPostModel.fromJson(Map<String, dynamic> json) => GetAllPostModel(
    success: json["success"],
    code: json["code"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "code": code,
    "data": data?.toJson(),
  };
}

class Data {
  String? id;
  String? firstname;
  String? lastname;
  String? businessname;
  String? phone;
  String? email;
  String? password;
  String? category;
  List<Post>? posts;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? refreshToken;

  Data({
    this.id,
    this.firstname,
    this.lastname,
    this.businessname,
    this.phone,
    this.email,
    this.password,
    this.category,
    this.posts,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.refreshToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    businessname: json["businessname"],
    phone: json["phone"],
    email: json["email"],
    password: json["password"],
    category: json["category"],
    posts: json["posts"] == null ? [] : List<Post>.from(json["posts"]!.map((x) => Post.fromJson(x))),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    refreshToken: json["refreshToken"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "firstname": firstname,
    "lastname": lastname,
    "businessname": businessname,
    "phone": phone,
    "email": email,
    "password": password,
    "category": category,
    "posts": posts == null ? [] : List<dynamic>.from(posts!.map((x) => x.toJson())),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "refreshToken": refreshToken,
  };
}

class Post {
  Images? images;
  String? id;
  String? title;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Post({
    this.images,
    this.id,
    this.title,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    images: json["images"] == null ? null : Images.fromJson(json["images"]),
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "images": images?.toJson(),
    "_id": id,
    "title": title,
    "description": description,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Images {
  String? publicId;
  String? url;
  String? resourceType;

  Images({
    this.publicId,
    this.url,
    this.resourceType,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    publicId: json["public_id"],
    url: json["url"],
    resourceType: json["resource_type"],
  );

  Map<String, dynamic> toJson() => {
    "public_id": publicId,
    "url": url,
    "resource_type": resourceType,
  };
}
