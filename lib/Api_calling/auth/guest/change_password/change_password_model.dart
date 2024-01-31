// To parse this JSON data, do
//
//     final changePasswordModel = changePasswordModelFromJson(jsonString);

import 'dart:convert';

ChangePasswordModel changePasswordModelFromJson(String str) => ChangePasswordModel.fromJson(json.decode(str));

String changePasswordModelToJson(ChangePasswordModel data) => json.encode(data.toJson());

class ChangePasswordModel {
  bool? success;
  int? code;
  Data? data;

  ChangePasswordModel({
    this.success,
    this.code,
    this.data,
  });

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) => ChangePasswordModel(
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
  String? email;
  String? password;
  String? role;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? refreshToken;
  String? passwordResetOtp;

  Data({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.refreshToken,
    this.passwordResetOtp,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    email: json["email"],
    password: json["password"],
    role: json["role"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    refreshToken: json["refreshToken"],
    passwordResetOtp: json["passwordResetOTP"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "firstname": firstname,
    "lastname": lastname,
    "email": email,
    "password": password,
    "role": role,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "refreshToken": refreshToken,
    "passwordResetOTP": passwordResetOtp,
  };
}
