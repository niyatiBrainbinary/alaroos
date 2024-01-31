import 'package:alaroos/Screen/Select_Language/select_language.dart';
import 'package:alaroos/Utils/pref_key.dart';
import 'package:alaroos/service/pref_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../Common/toast.dart';
import '../../../../Utils/api_res.dart';
import '../../../../service/http_service.dart';

class GuestRegisterApi {
  static guestRegisterApi({password, firstName, lastName, email}) async {
    String url = EndPoints.guestRegister;

    http.Response? response = await HttpService.postApi(url: url, body: {
      "firstname": firstName,
      "lastname": lastName,
      "email": email,
      "password": password
    });
    final decoded = jsonDecode(response!.body);
    print(decoded);
    if (response.statusCode == 200) {
      // flutterToast(decoded["message"]["en"]);
      // PrefService.setValue(PrefKeys.loginType, role.toString().capitalizeFirst);

      PrefService.setValue(PrefKeys.firstName, decoded["user"]["firstname"]);
      PrefService.setValue(PrefKeys.lastName, decoded["user"]["lastname"]);
      PrefService.setValue(PrefKeys.email, decoded["user"]["email"]);
      PrefService.setValue(PrefKeys.employeeId, decoded["user"]["_id"]);
      PrefService.setValue(PrefKeys.type,"user");
      debugPrint(
          "First Name After Register Api${PrefService.getString(PrefKeys.firstName)}");
      PrefService.setValue(PrefKeys.guestLogin, true);

      bool isUpdate = false;
      String docId ='';
      if(decoded["user"]["email"] != null) {
        var bussinessData = await FirebaseFirestore.instance.collection("Auth")
            .doc("User").collection("UserEntry")
            .get();

        bussinessData.docs.forEach((element) {
          if (element['email'] == decoded["user"]["email"]) {
            isUpdate = true;
            docId = element.id;
          }
        });
        if (isUpdate) {
          await FirebaseFirestore.instance.collection("Auth").doc("User")
              .collection("UserEntry").doc(docId)
              .update({
            "firstName": decoded["user"]["firstname"],
            "lastName": decoded["user"]["lastname"],
            "email": decoded["user"]["email"],
          });
        }
        else {
          await FirebaseFirestore.instance.collection("Auth")
              .doc("User")
              .collection("UserEntry")
              .add({
            "firstName": decoded["user"]["firstname"],
            "lastName": decoded["user"]["lastname"],
            "email": decoded["user"]["email"],
          });
        }
      }

      Get.to(() => Select_Language());
      return response.body;
    }
    else {
     // errorToast(decoded["message"]);
    }
    return null;
  }
}
