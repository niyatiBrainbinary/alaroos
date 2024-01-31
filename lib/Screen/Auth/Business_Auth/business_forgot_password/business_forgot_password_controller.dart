import 'package:alaroos/Api_calling/auth/guest/forgot_password/forgot_password_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../Api_calling/auth/business/forgot_password/business_forgot_password_api.dart';
import '../../../../Utils/string.dart';
import '../../../Select_Language/select_language.dart';

class BusinessForgotController extends GetxController {
  TextEditingController forgotEmailController = TextEditingController();
  String forgotEmail = "";
  String emailError = "";


  RxBool isLoading = false.obs;

  businessForgotPassword({email}) async {
    isLoading.value = true;
    await BusinessForgotPasswordApi.businessForgotPasswordApi(email: email);
    isLoading.value = false;
  }

  emailValidation() {
    update(['business_login']);
    if (forgotEmailController.text.trim() == "") {
      // errorToast(StringRes.enterEmailError.tr);
      emailError = Strings.emailError;
      update(['business_login']);
      return false;
    } else {
      if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(forgotEmailController.text)) {
        emailError = '';
        update(['business_login']);
        return true;
      } else {
        // errorToast(StringRes.enterValidEmail.tr);
        emailError = Strings.emailError1;
        update(['business_login']);
        return false;
      }
    }
  }


  val() async {
    emailValidation();
  }

   validation() {
    val();
    if (emailError == '') {
      return true;
    } else {
      return false;
    }
  }

 /* onTapForgotEmail() {
    if (validation()) {
      Get.to(() => Select_Language());
    }
  }*/
}
