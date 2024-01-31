import 'package:alaroos/Api_calling/auth/business/business_change_password/business_change_passwrod_model.dart';
import 'package:alaroos/Screen/Auth/Business_Auth/Business_login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../Screen/Auth/Guest_Auth/Guest_login/gusest_login.dart';
import '../../../../Utils/api_res.dart';
import '../../../../Utils/pref_key.dart';
import '../../../../service/http_service.dart';
import '../../../../service/pref_service.dart';

class BusinessChangePasswordApi {
  static Future businessChangePasswordApi({password, email}) async {
    try {
      var headers = {
        'Authorization':
        "Bearer ${PrefService.getString(PrefKeys.registerToken)}",

      };
      var response = await HttpService.putApi(
        url:
        "${EndPoints.businessChangePassword}/${PrefService.getString(PrefKeys.employeeId)}",
        body: {"password": password},
        header: headers,
      );

      if (response != null && response.statusCode == 200) {
        print(response.body);
        if (businessChangePasswordModelFromJson(response.body).success ==
            'Password Reset Successfully') {

        }
        Get.offAll(() => Business_Login_Screen());

        return businessChangePasswordModelFromJson(response.body);
      } else {
        // Handle other status codes if needed--
        debugPrint("HTTP Status Code: ${response!.statusCode}");
      }
      return BusinessChangePasswordModel();
    } catch (e) {
      debugPrint("Error: $e");
      return BusinessChangePasswordModel();
    }
  }
}