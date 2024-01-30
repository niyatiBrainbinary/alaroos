import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../Api_calling/auth/verify_otp/verify_otp_api.dart';
import '../../../../Utils/string.dart';

class VerifyOtpController extends GetxController {
  TextEditingController otpController = TextEditingController();
  String otpError = "";
  RxBool isLoading = false.obs;

  verifyOtp ({otp}) async {
    isLoading.value = true;
    await VerifyOtpApi.verifyOtpApi(otp: otp);
    isLoading.value = false;
  }
  onTapSubmit() {
    if (otpController.text != '') {
      if (otpController.text.length == 6) {
        otpError = "";

      } else {
        otpError = Strings.enterValidOtp.tr;
      }
    } else {
      otpError = Strings.enterOtp.tr;
    }
    update(['otp']);
  }

}