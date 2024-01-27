import 'dart:convert';

import 'package:alaroos/Api_calling/auth/guest/guest_login/guest_login_model.dart';
import 'package:alaroos/Utils/api_res.dart';
import 'package:alaroos/Utils/pref_key.dart';
import 'package:alaroos/service/pref_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../Common/toast.dart';
import '../../../../Screen/Select_Language/select_language.dart';
import '../../../../Utils/string.dart';
import '../../../../service/http_service.dart';


class GuestLoginApi {
  static Future guestLoginApi(
      {required String email,
        required String password,
       // required String userType
      }) async {
    try {


      http.Response? response = await HttpService.postApi(body: {
        "email": email,
        "password": password,
      }, url: "https://e2da-2405-201-2024-ad6b-59a2-389b-7a04-167f.ngrok-free.app/api/user/login-user",
      );
      if (response!.statusCode == 200) {

        var decoded = jsonDecode(response.body);
        debugPrint('=========$decoded');

        // if(decoded["success"]== true){
        PrefService.setValue(PrefKeys.login, true);
        // PrefService.setValue(PrefKeys.firstName, decoded["data"]["firstname"]);
        Get.to(() => Select_Language());

        return guestLoginModelFromJson(response.body);
      } else {
        debugPrint('Error:::: ${response.body}');
        errorToast(Strings.userNotFound);
        return GuestLoginModel();
      }
    } catch (e) {
      errorToast(Strings.somethingWentWrong);
      return GuestLoginModel();
    }
  }
}