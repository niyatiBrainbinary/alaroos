import 'dart:convert';

import 'package:alaroos/Api_calling/screen/edit_profile/edit_profile_model.dart';
import 'package:alaroos/Screen/Account_Screen/Profile_Screen/profile_screen_controller.dart';
import 'package:alaroos/Screen/Account_Screen/account_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../Common/toast.dart';
import '../../../Utils/api_res.dart';
import '../../../Utils/pref_key.dart';
import '../../../Utils/string.dart';
import '../../../service/http_service.dart';
import '../../../service/pref_service.dart';

class EditProfileApi {
  static editProfileApi({ firstName, lastName, businessName, phone, email, profileImage}) async {
    try {
      var headers = {
         'Authorization': "Bearer ${PrefService.getString(PrefKeys.registerToken)}",
      };
      var response = await HttpService.putApi(
        url: "${EndPoints.editProfile}/${PrefService.getString(PrefKeys.employeeId)}",
        body: {

          "firstname": firstName,
          "lastname" : lastName,
          "businessname" : businessName,
          "email": email,
          "phone": phone,
          //"password": "userb1203",
         "profileimage": profileImage
        },
       header: headers,
      );

      if (response?.statusCode == 200) {
Get.to(Account_Screen());
       // Get.back();
        return editProfileModelFromJson(response!.body);


      } else {
        // Handle other status codes if needed
        debugPrint("HTTP Status Code: ${response!.statusCode}");
      }
      return EditProfileModel();
    } catch (e) {
      debugPrint("Error: $e");
      return EditProfileModel();
    }
  }
}
