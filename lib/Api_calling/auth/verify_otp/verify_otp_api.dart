import 'dart:convert';

import 'package:alaroos/service/pref_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Common/toast.dart';
import '../../../Screen/Auth/Guest_Auth/change_password/change_password_screen.dart';
import '../../../Utils/api_res.dart';
import 'package:http/http.dart' as http;

import '../../../Utils/pref_key.dart';
import '../../../service/http_service.dart';

class VerifyOtpApi {
  static Future verifyOtpApi ({required String otp}) async {
    String url = "${EndPoints.verifyOtp}/${PrefService.getString(PrefKeys.employeeId)}";


    try {
      http.Response? response = await HttpService.postApi(url: url,
          body: {
            "otp": otp
          }
      );
      if(response!.statusCode == 200) {
        var decoded = jsonDecode(response.body);
        debugPrint('===========$decoded');
        Get.to(()=> ChangePasswordScreen());
      }
    } catch (e) {
      // Handle network or other errors
      print('Error: $e');
    }
   /* var request = http.MultipartRequest('POST', Uri.parse(url));

    request.fields.addAll({
      "otp":otp});

    var response = await request.send();
    var responded = await http.Response.fromStream(response);
    final decoded = jsonDecode(responded.body);
    if(response.statusCode == 200){
      print(decoded);

      Get.to(() => ChangePasswordScreen());
    } else {
     // if(PrefService.getString(PrefKeys.language) =="Spanish"){

        errorToast(decoded['message']['es']);

     // }
     //  else {
     //    errorToast(decoded['message']['en']);
     //  }

    }*/
  }
}