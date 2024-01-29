import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Common/toast.dart';
import '../../../Utils/api_res.dart';
import 'package:http/http.dart' as http;

class VerifyOtpApi {
  static Future verifyOtpApi ({required String email,required String otp}) async {
    String url = EndPoints.verifyOtp;
    var request = http.MultipartRequest('POST', Uri.parse(url));

    request.fields.addAll({"email":email,
      "otp":otp});

    var response = await request.send();
    var responded = await http.Response.fromStream(response);
    final decoded = jsonDecode(responded.body);
    if(response != null && response.statusCode == 200){
      print(decoded);

     // Get.to(() => ChangePassword(email: email,perameter: 1));
    } else {
     // if(PrefService.getString(PrefKeys.language) =="Spanish"){

        errorToast(decoded['message']['es']);

     // }
     //  else {
     //    errorToast(decoded['message']['en']);
     //  }

    }
  }
}