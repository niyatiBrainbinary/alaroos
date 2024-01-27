import 'package:alaroos/Screen/Auth/Forgot_Password/ForgotPassword.dart';
import 'package:alaroos/Screen/Select_Language/select_language.dart';
import 'package:alaroos/Utils/pref_key.dart';
import 'package:alaroos/service/pref_service.dart';
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
      {password, firstName, lastName, mobile,businessname, categoryId ,email}) async {
    String url = EndPoints.businessRegister;

/*    Map<String, dynamic> translateBody = {
      "firstname":"userb7",
      "lastname" : "doeb7",
      "businessname" : "businessname7",
      "category" : "65b08d33337cbdecccfcc998",
      "email": "userb6@gmail.com",
      "phone": "9876543211",
      "password": "userb123"
    };

    Map<String, dynamic> withOutTranslateBody = {
      "email": email,
      "password": password,
      "role": role,
      "firstName": firstName,
      "lastName": lastName,
      "deviceToken" : deviceToken,
      "mobile": mobile,
      "dob": dob,
      "profileImage": profileImage,
      "location": {
        "type": "Point",
        "coordinates": [longitude, latitude]
      },
    };*/

    http.Response? response = await HttpService.postApi(
        url: url,
       body: {
         "firstname":firstName,
         "lastname" : lastName,
         "businessname" : businessname,
         "email": email,
         "category" : categoryId,
         "phone": mobile,
         "password":password
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
      PrefService.setValue(PrefKeys.firstName, decoded["user"]["firstname"]);
      debugPrint("First Name After Register Api${PrefService.getString(PrefKeys.firstName)}");
      Get.to(() => Select_Language());
      return response.body;
    }  else {
      errorToast(decoded["message"]);

    }
    return null;
  }
}