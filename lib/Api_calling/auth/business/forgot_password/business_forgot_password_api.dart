import 'dart:convert';

import 'package:alaroos/Screen/Auth/Business_Auth/business_verify_otp/business_verify_otp_screen.dart';
import 'package:alaroos/Utils/api_res.dart';
import 'package:alaroos/Utils/pref_key.dart';
import 'package:alaroos/service/http_service.dart';
import 'package:alaroos/service/pref_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../Screen/Auth/Guest_Auth/reset_password/reset_password_screen.dart';
import '../../../../Screen/Auth/Guest_Auth/verify_otp/verify_otp_screen.dart';
import '../../../../Screen/Select_Language/select_language.dart';

class BusinessForgotPasswordApi {
  static Future  businessForgotPasswordApi({ required String email}) async{
    final apiUrl = "${EndPoints.businessForgotPassword}";


    //   'https://e2da-2405-201-2024-ad6b-59a2-389b-7a04-167f.ngrok-free.app/api/user/forgot-password';

    try {
      http.Response? response = await HttpService.postApi(url: apiUrl,
          body: {
            "email": email
          }
      );
      if(response!.statusCode == 200) {
        var decoded = jsonDecode(response.body);
        PrefService.setValue(PrefKeys.employeeId, decoded['user']['_id']);
        debugPrint('===========$decoded');
        Get.to(()=> BusinessVerifyOtpScreen());
      }
    } catch (e) {
      // Handle network or other errors
      print('Error: $e');
    }
  }
}