// To parse this JSON data, do
//
//     final logoutModel = logoutModelFromJson(jsonString);

import 'dart:convert';

LogoutModel logoutModelFromJson(String str) => LogoutModel.fromJson(json.decode(str));

String logoutModelToJson(LogoutModel data) => json.encode(data.toJson());

class LogoutModel {
  bool? success;
  int? code;
  String? message;

  LogoutModel({
    this.success,
    this.code,
    this.message,
  });

  factory LogoutModel.fromJson(Map<String, dynamic> json) => LogoutModel(
    success: json["success"],
    code: json["code"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "code": code,
    "message": message,
  };
}
