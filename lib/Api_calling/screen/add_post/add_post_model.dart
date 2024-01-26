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
  List<Image>? images;
  List<Image>? videos;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.title,
    this.description,
    this.images,
    this.videos,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    title: json["title"],
    description: json["description"],
    images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
    videos: json["videos"] == null ? [] : List<Image>.from(json["videos"]!.map((x) => Image.fromJson(x))),
    id: json["_id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
    "videos": videos == null ? [] : List<dynamic>.from(videos!.map((x) => x.toJson())),
    "_id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Image {
  String? publicId;
  String? url;
  String? id;

  Image({
    this.publicId,
    this.url,
    this.id,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    publicId: json["public_id"],
    url: json["url"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "public_id": publicId,
    "url": url,
    "_id": id,
  };
}
