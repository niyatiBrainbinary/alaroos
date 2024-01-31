import 'dart:convert';

import 'package:alaroos/Common/toast.dart';
import 'package:alaroos/service/pref_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:http/http.dart' as http;

import '../../../../Screen/Auth/Business_Auth/business_change_password/business_change_password_screen.dart';
import '../../../../Utils/api_res.dart';
import '../../../../Utils/pref_key.dart';
import '../../../../Utils/string.dart';
import '../../../../service/http_service.dart';

class BusinessVerifyOtpApi {
  static Future businessVerifyOtpApi ({required String otp}) async {
    String url = "${EndPoints.businessVerifyOtp}/${PrefService.getString(PrefKeys.employeeId)}";


    try {
      http.Response? response = await HttpService.postApi(url: url,
          body: {
            "otp": otp
          }
      );
      if(response!.statusCode == 200) {
        var decoded = jsonDecode(response.body);
        debugPrint('===========$decoded');
        Get.to(()=> BusinessChangePasswordScreen());
      }
      errorToast(Strings.enterValidOtp);
    } catch (e) {
      //errorToast(Strings.enterValidOtp);
      // Handle network or other errors
      print('Error: $e');
    }


  }
}