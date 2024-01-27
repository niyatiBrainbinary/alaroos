// To parse this JSON data, do
//
//     final guestLoginModel = guestLoginModelFromJson(jsonString);

import 'dart:convert';

GuestLoginModel guestLoginModelFromJson(String str) => GuestLoginModel.fromJson(json.decode(str));

String guestLoginModelToJson(GuestLoginModel data) => json.encode(data.toJson());

class GuestLoginModel {
  bool? success;
  int? code;
  Data? data;

  GuestLoginModel({
    this.success,
    this.code,
    this.data,
  });

  factory GuestLoginModel.fromJson(Map<String, dynamic> json) => GuestLoginModel(
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
  String? role;
  String? token;

  Data({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.role,
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    email: json["email"],
    role: json["role"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "firstname": firstname,
    "lastname": lastname,
    "email": email,
    "role": role,
    "token": token,
  };
}
