// To parse this JSON data, do
//
//     final guestRegisterModel = guestRegisterModelFromJson(jsonString);

import 'dart:convert';

GuestRegisterModel guestRegisterModelFromJson(String str) => GuestRegisterModel.fromJson(json.decode(str));

String guestRegisterModelToJson(GuestRegisterModel data) => json.encode(data.toJson());

class GuestRegisterModel {
  bool? success;
  int? code;
  User? user;

  GuestRegisterModel({
    this.success,
    this.code,
    this.user,
  });

  factory GuestRegisterModel.fromJson(Map<String, dynamic> json) => GuestRegisterModel(
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
  String? email;
  String? password;
  String? role;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  User({
    this.firstname,
    this.lastname,
    this.email,
    this.password,
    this.role,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    firstname: json["firstname"],
    lastname: json["lastname"],
    email: json["email"],
    password: json["password"],
    role: json["role"],
    id: json["_id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "firstname": firstname,
    "lastname": lastname,
    "email": email,
    "password": password,
    "role": role,
    "_id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
