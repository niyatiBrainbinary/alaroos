import 'dart:convert';

import 'package:alaroos/service/pref_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../Common/toast.dart';
import '../../../../Screen/Auth/Guest_Auth/change_password/change_password_screen.dart';
import '../../../../Utils/api_res.dart';
import '../../../../Utils/pref_key.dart';
import '../../../../Utils/string.dart';
import '../../../../service/http_service.dart';
import 'package:http/http.dart' as http;


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

      } else {
        errorToast(Strings.enterValidOtp);
      }

    } catch (e) {
      // Handle network or other errors
      print('Error: $e');
    }

  }
}