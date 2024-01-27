// To parse this JSON data, do
//
//     final getAllPostModel = getAllPostModelFromJson(jsonString);

import 'dart:convert';

GetAllPostModel getAllPostModelFromJson(String str) => GetAllPostModel.fromJson(json.decode(str));

String getAllPostModelToJson(GetAllPostModel data) => json.encode(data.toJson());

class GetAllPostModel {
  bool? success;
  int? code;
  List<Datum>? data;

  GetAllPostModel({
    this.success,
    this.code,
    this.data,
  });

  factory GetAllPostModel.fromJson(Map<String, dynamic> json) => GetAllPostModel(
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
  String? id;
  String? title;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  Images? images;

  Datum({
    this.id,
    this.title,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.images,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    images: json["images"] == null ? null : Images.fromJson(json["images"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "description": description,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "images": images?.toJson(),
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
