// To parse this JSON data, do
//
//     final addPostModel = addPostModelFromJson(jsonString);

import 'dart:convert';

AddPostModel addPostModelFromJson(String str) => AddPostModel.fromJson(json.decode(str));

String addPostModelToJson(AddPostModel data) => json.encode(data.toJson());

class AddPostModel {
  bool? success;
  int? code;
  Data? data;

  AddPostModel({
    this.success,
    this.code,
    this.data,
  });

  factory AddPostModel.fromJson(Map<String, dynamic> json) => AddPostModel(
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
  String? title;
  String? description;
  Images? images;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.title,
    this.description,
    this.images,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    title: json["title"],
    description: json["description"],
    images: json["images"] == null ? null : Images.fromJson(json["images"]),
    id: json["_id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "images": images?.toJson(),
    "_id": id,
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
