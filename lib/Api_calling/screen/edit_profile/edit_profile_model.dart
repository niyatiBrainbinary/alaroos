// To parse this JSON data, do
//
//     final editProfileModel = editProfileModelFromJson(jsonString);

import 'dart:convert';

EditProfileModel editProfileModelFromJson(String str) => EditProfileModel.fromJson(json.decode(str));

String editProfileModelToJson(EditProfileModel data) => json.encode(data.toJson());

class EditProfileModel {
  bool? success;
  int? code;
  Data? data;

  EditProfileModel({
    this.success,
    this.code,
    this.data,
  });

  factory EditProfileModel.fromJson(Map<String, dynamic> json) => EditProfileModel(
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
  List<String>? posts;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? refreshToken;
  String? profileimage;

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
    this.profileimage,
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
    posts: json["posts"] == null ? [] : List<String>.from(json["posts"]!.map((x) => x)),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    refreshToken: json["refreshToken"],
    profileimage: json["profileimage"],
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
    "posts": posts == null ? [] : List<dynamic>.from(posts!.map((x) => x)),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "refreshToken": refreshToken,
    "profileimage": profileimage,
  };
}
