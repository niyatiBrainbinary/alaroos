// To parse this JSON data, do
//
//     final businessRegisterModel = businessRegisterModelFromJson(jsonString);

import 'dart:convert';

BusinessRegisterModel businessRegisterModelFromJson(String str) => BusinessRegisterModel.fromJson(json.decode(str));

String businessRegisterModelToJson(BusinessRegisterModel data) => json.encode(data.toJson());

class BusinessRegisterModel {
  bool? success;
  int? code;
  User? user;

  BusinessRegisterModel({
    this.success,
    this.code,
    this.user,
  });

  factory BusinessRegisterModel.fromJson(Map<String, dynamic> json) => BusinessRegisterModel(
    success: json["success"],
    code: json["code"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "code": code,
    "user": user?.toJson(),
  };
}

class User {
  String? firstname;
  String? lastname;
  String? businessname;
  String? phone;
  String? email;
  String? password;
  List<String>? category;
  List<dynamic>? posts;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  User({
    this.firstname,
    this.lastname,
    this.businessname,
    this.phone,
    this.email,
    this.password,
    this.category,
    this.posts,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    firstname: json["firstname"],
    lastname: json["lastname"],
    businessname: json["businessname"],
    phone: json["phone"],
    email: json["email"],
    password: json["password"],
    category: json["category"] == null ? [] : List<String>.from(json["category"]!.map((x) => x)),
    posts: json["posts"] == null ? [] : List<dynamic>.from(json["posts"]!.map((x) => x)),
    id: json["_id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "firstname": firstname,
    "lastname": lastname,
    "businessname": businessname,
    "phone": phone,
    "email": email,
    "password": password,
    "category": category == null ? [] : List<dynamic>.from(category!.map((x) => x)),
    "posts": posts == null ? [] : List<dynamic>.from(posts!.map((x) => x)),
    "_id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
