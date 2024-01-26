// To parse this JSON data, do
//
//     final addVideoModel = addVideoModelFromJson(jsonString);

import 'dart:convert';

AddVideoModel addVideoModelFromJson(String str) => AddVideoModel.fromJson(json.decode(str));

String addVideoModelToJson(AddVideoModel data) => json.encode(data.toJson());

class AddVideoModel {
  bool? sucess;
  int? code;
  String? message;
  List<Datum>? data;

  AddVideoModel({
    this.sucess,
    this.code,
    this.message,
    this.data,
  });

  factory AddVideoModel.fromJson(Map<String, dynamic> json) => AddVideoModel(
    sucess: json["sucess"],
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "sucess": sucess,
    "code": code,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? mediaUrl;
  String? publicId;

  Datum({
    this.mediaUrl,
    this.publicId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    mediaUrl: json["mediaUrl"],
    publicId: json["public_id"],
  );

  Map<String, dynamic> toJson() => {
    "mediaUrl": mediaUrl,
    "public_id": publicId,
  };
}
