import 'dart:convert';

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

import 'Business_login_model/business_login_model.dart';

class LoginApi {
  static Future loginApi(
      {required String email,
      required String password,
      required String userType}) async {
    try {
      String url =
          "${EndPoints.businesslogin}?email=$email&password=$password&userTypes=$userType";

      http.Response? response = await HttpService.postApi(body: {
        "email": email,
        "password": password,
      }, url: url);

      if (response!.statusCode == 200) {
        var decoded = jsonDecode(response.body);
        debugPrint('=========$decoded');

        // if(decoded["success"]== true){
        PrefService.setValue(PrefKeys.login, true);
        // PrefService.setValue(PrefKeys.firstName, decoded["data"]["firstname"]);
        Get.to(() => Select_Language());

        return businessLoginModelFromJson(response.body);
      } else {
        debugPrint('Error:::: ${response.body}');
        errorToast(Strings.userNotFound);
        return BusinessLoginModel();
      }
    } catch (e) {
      errorToast(Strings.somethingWentWrong);
      return BusinessLoginModel();
    }
  }
}
