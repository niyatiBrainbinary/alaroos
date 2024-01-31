import 'dart:convert';

import 'package:alaroos/Api_calling/auth/guest/change_password/change_password_model.dart';
import 'package:alaroos/Api_calling/screen/edit_profile/edit_profile_model.dart';
import 'package:alaroos/Screen/Account_Screen/Profile_Screen/profile_screen_controller.dart';
import 'package:alaroos/Screen/Auth/Guest_Auth/Guest_login/gusest_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import '../../../../Common/toast.dart';
import '../../../../Utils/api_res.dart';
import '../../../../Utils/pref_key.dart';
import '../../../../service/http_service.dart';
import '../../../../service/pref_service.dart';

/*class ChangePasswordApi {
  static Future changePasswordApi(
      {required String password}) async {
    String url = "${EndPoints.changePassword}/${PrefService.getString(PrefKeys.employeeId)}";
    var request = http.MultipartRequest('PUT', Uri.parse(url));

    request.fields.addAll({"password": password});

    var response = await request.send();
    var responsed = await http.Response.fromStream(response);
    final decoded = jsonDecode(responsed.body);

    if (response != null && response.statusCode == 200) {
      print(decoded);

      */ /*if (PrefService.getString(PrefKeys.language) == "Spanish") {
        flutterToast(decoded['message']["es"]);
      } else {
        flutterToast(decoded['message']["en"]);
      }*/ /*
      await PrefService.clear();
      Get.offAll(() => GuestLoginScreen());
    } else {
      debugPrint("Error:***************************");
      return ChangePasswordModel();
      */ /*if (PrefService.getString(PrefKeys.language) == "Spanish") {
        errorToast(decoded['message']);
      } else {
        errorToast(decoded['message']);
      }*/ /*
    }
  }
}*/

class ChangePasswordApi {
  static Future changePasswordApi({password, email}) async {
    try {
      var headers = {
        'Authorization':
            "Bearer ${PrefService.getString(PrefKeys.registerToken)}",

      };
      var response = await HttpService.putApi(
        url:
            "${EndPoints.changePassword}/${PrefService.getString(PrefKeys.employeeId)}",
        body: {"password": password},
        header: headers,
      );

      if (response != null && response.statusCode == 200) {
        print(response.body);
        if (changePasswordModelFromJson(response.body).success ==
            'Password Reset Successfully') {

        }
        Get.offAll(() => GuestLoginScreen());

        return changePasswordModelFromJson(response.body);
      } else {
        // Handle other status codes if needed--
        debugPrint("HTTP Status Code: ${response!.statusCode}");
      }
      return ChangePasswordModel();
    } catch (e) {
      debugPrint("Error: $e");
      return ChangePasswordModel();
    }
  }
}
