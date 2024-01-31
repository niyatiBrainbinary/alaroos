// To parse this JSON data, do
//
//     final allPostModel = allPostModelFromJson(jsonString);

import 'dart:convert';

AllPostModel allPostModelFromJson(String str) => AllPostModel.fromJson(json.decode(str));

String allPostModelToJson(AllPostModel data) => json.encode(data.toJson());

class AllPostModel {
  bool? success;
  int? code;
  List<Datum>? data;

  AllPostModel({
    this.success,
    this.code,
    this.data,
  });

  factory AllPostModel.fromJson(Map<String, dynamic> json) => AllPostModel(
    success: json["success"],
    code: json["code"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "code": code,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Images? images;
  String? id;
  String? title;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Datum({
    this.images,
    this.id,
    this.title,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
