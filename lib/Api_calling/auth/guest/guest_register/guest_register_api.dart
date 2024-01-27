import 'package:alaroos/Screen/Auth/Forgot_Password/ForgotPassword.dart';
import 'package:alaroos/Screen/Select_Language/select_language.dart';
import 'package:alaroos/Utils/pref_key.dart';
import 'package:alaroos/service/pref_service.dart';
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
      debugPrint(
          "First Name After Register Api${PrefService.getString(PrefKeys.firstName)}");
      Get.to(() => Select_Language());
      return response.body;
    } else {
      errorToast(decoded["message"]);
    }
    return null;
  }
}
