import 'package:alaroos/Screen/Select_Language/select_language.dart';
import 'package:alaroos/Utils/pref_key.dart';
import 'package:alaroos/service/pref_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import '../../../Common/toast.dart';
import '../../../Utils/api_res.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../service/http_service.dart';

class BusinessRegisterApi {
  static businessRegisterApi(
      {password,
      firstName,
      lastName,
      mobile,
      businessname,
      categoryId,
      email}) async {
    String url = EndPoints.businessRegister;

    http.Response? response = await HttpService.postApi(
      url: url,
      body: {
        "firstname": firstName,
        "lastname": lastName,
        "businessname": businessname,
        "email": email,
        "category": categoryId,
        "phone": mobile,
        "password": password
      },
      /* header: {
          'Content-Type': 'application/json',
        }*/
    );
    final decoded = jsonDecode(response!.body);
    print(decoded);
    if (response.statusCode == 200) {
      // flutterToast(decoded["message"]["en"]);
      // PrefService.setValue(PrefKeys.loginType, role.toString().capitalizeFirst);
      PrefService.setValue(PrefKeys.firstNameBusiness, decoded["user"]["firstname"]);
      PrefService.setValue(PrefKeys.lastNameBusiness, decoded["user"]["lastname"]);
      PrefService.setValue(PrefKeys.emailBusiness, decoded["user"]["email"]);
      PrefService.setValue(PrefKeys.mobileNumberBusiness, decoded["user"]["phone"]);
      PrefService.setValue(PrefKeys.employeeIdBusiness, decoded["user"]["_id"]);
      PrefService.setValue(PrefKeys.type,"business");

      debugPrint(
          "First Name After Register Api${PrefService.getString(PrefKeys.firstName)}");
      PrefService.setValue(PrefKeys.login, true);

      bool isUpdate = false;
      String docId ='';
      var bussinessData =  await  FirebaseFirestore.instance.collection("Auth").doc("Business").collection("BusinessEntry").get();
      bussinessData.docs.forEach((element) {
        if(element['businessEmail'] == decoded["user"]["email"])
        {
          isUpdate = true;
          docId = element.id;
        }
      });

if(isUpdate){
  await FirebaseFirestore.instance.collection("Auth").doc("Business").collection("BusinessEntry").doc(docId).update({
    "firstName":decoded["user"]["firstname"],
    "lastName":decoded["user"]["lastname"],
    "businessName":decoded["user"]["businessname"],
    "businessEmail":decoded["user"]["email"],
    "businessPhone":decoded["user"]["phone"],
  });
}
else
  {
    await FirebaseFirestore.instance.collection("Auth").doc("Business").collection("BusinessEntry").add({
      "firstName":decoded["user"]["firstname"],
      "lastName":decoded["user"]["lastname"],
      "businessName":decoded["user"]["businessname"],
      "businessEmail":decoded["user"]["email"],
      "businessPhone":decoded["user"]["phone"],
    });
  }


      Get.to(() => Select_Language());
      return response.body;
    } else {
      errorToast(decoded["message"]);
    }
    return null;
  }
}
