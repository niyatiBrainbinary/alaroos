import 'dart:convert';

BusinessLoginModel businessLoginModelFromJson(String str) => BusinessLoginModel.fromJson(json.decode(str));

String businessLoginModelToJson(BusinessLoginModel data) => json.encode(data.toJson());

class BusinessLoginModel {
  bool status;
  int code;
  Data data;

  BusinessLoginModel({
    required this.status,
    required this.code,
    required this.data,
  });

  factory BusinessLoginModel.fromJson(Map<String, dynamic> json) => BusinessLoginModel(
    status: json["status"],
    code: json["code"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "data": data.toJson(),
  };
}

class Data {
  String id;
  String firstname;
  String lastname;
  String businessname;
  List<String> category;
  String email;
  String phone;
  String token;

  Data({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.businessname,
    required this.category,
    required this.email,
    required this.phone,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    businessname: json["businessname"],
    category: List<String>.from(json["category"].map((x) => x)),
    email: json["email"],
    phone: json["phone"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "firstname": firstname,
    "lastname": lastname,
    "businessname": businessname,
    "category": List<dynamic>.from(category.map((x) => x)),
    "email": email,
    "phone": phone,
    "token": token,
  };
}
