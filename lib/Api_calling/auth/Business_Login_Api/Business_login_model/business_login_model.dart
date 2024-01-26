// To parse this JSON data, do
//
//     final businessLoginModel = businessLoginModelFromJson(jsonString);

import 'dart:convert';

BusinessLoginModel businessLoginModelFromJson(String str) => BusinessLoginModel.fromJson(json.decode(str));

String businessLoginModelToJson(BusinessLoginModel data) => json.encode(data.toJson());

class BusinessLoginModel {
  bool? status;
  int? code;
  Data? data;

  BusinessLoginModel({
    this.status,
    this.code,
    this.data,
  });

  factory BusinessLoginModel.fromJson(Map<String, dynamic> json) => BusinessLoginModel(
    status: json["status"],
    code: json["code"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "data": data?.toJson(),
  };
}

class Data {
  String? id;
  String? firstname;
  String? lastname;
  String? businessname;
  String? category;
  String? email;
  String? phone;
  String? token;

  Data({
    this.id,
    this.firstname,
    this.lastname,
    this.businessname,
    this.category,
    this.email,
    this.phone,
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    businessname: json["businessname"],
    category: json["category"],
    email: json["email"],
    phone: json["phone"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "firstname": firstname,
    "lastname": lastname,
    "businessname": businessname,
    "category": category,
    "email": email,
    "phone": phone,
    "token": token,
  };
}
