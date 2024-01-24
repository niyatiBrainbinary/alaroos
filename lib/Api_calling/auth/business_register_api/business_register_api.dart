import 'package:alaroos/Screen/Auth/Forgot_Password/forgot_pass.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import '../../../Common/toast.dart';
import '../../../Utils/api_res.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../service/http_service.dart';

class BusinessRegisterApi {
  static businessRegisterApi(
      {email, password, firstName, lastName, mobile,businessname, category  }) async {
    String url = EndPoints.businessRegister;

    Map<String, dynamic> translateBody = {
      "firstname":"userb7",
      "lastname" : "doeb7",
      "businessname" : "businessname7",
      "category" : "65b08d33337cbdecccfcc998",
      "email": "userb6@gmail.com",
      "phone": "9876543211",
      "password": "userb123"
    };

   /* Map<String, dynamic> withOutTranslateBody = {
      "email": email,
      "password": password,
      "role": role,
      "firstName": firstName,
      "lastName": lastName,
      "deviceToken" : deviceToken,
      "mobile": mobile,
      "dob": dob,
      "profileImage": profileImage,
      "location": {
        "type": "Point",
        "coordinates": [longitude, latitude]
      },
    };*/

    http.Response? response = await HttpService.postApi(
        url: url,
       body: {
         "firstname":firstName,
         "lastname" : lastName,
         "businessname" : businessname,
         "category" : category,
         "email": email,
         "phone": mobile,
         "password":password
       },
       /* body: (translateFirstName.toString().isEmpty && translateLastName.toString().isEmpty)
            ? jsonEncode(withOutTranslateBody)
            : jsonEncode(translateBody),*/
        header: {
          'Content-Type': 'application/json',
        });
    final decoded = jsonDecode(response!.body);
    print(decoded);
    if (response.statusCode == 200) {
      // flutterToast(decoded["message"]["en"]);
      // PrefService.setValue(PrefKeys.loginType, role.toString().capitalizeFirst);
      Get.to(() => Forgot_Password_Screen());
      return response.body;
    }  else {
      errorToast(decoded["message"]);

    }
    return null;
  }
}