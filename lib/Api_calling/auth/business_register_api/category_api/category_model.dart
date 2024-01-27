// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  bool? success;
  int? code;
  String? message;
  List<CatData>? data;

  CategoryModel({
    this.success,
    this.code,
    this.message,
    this.data,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    success: json["success"],
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? [] : List<CatData>.from(json["data"]!.map((x) => CatData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "code": code,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class CatData {
  String? id;
  String? title;
  bool? active;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  CatData({
    this.id,
    this.title,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CatData.fromJson(Map<String, dynamic> json) => CatData(
    id: json["_id"],
    title: json["title"],
    active: json["active"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "active": active,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
