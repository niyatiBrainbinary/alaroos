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
      }, url: EndPoints.guestLogin,
      );
      final decod = jsonDecode(response!.body);
      print(decod);
      if (response.statusCode == 200) {

  PrefService.setValue(PrefKeys.firstName, decod['data']['firstname']);
  PrefService.setValue(PrefKeys.lastName, decod['data']['lastname']);
  PrefService.setValue(PrefKeys.email, decod['data']['email']);
  PrefService.setValue(PrefKeys.employeeId, decod['data']['_id']);
  debugPrint("============================${PrefService.getString(PrefKeys.employeeId)}");

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
