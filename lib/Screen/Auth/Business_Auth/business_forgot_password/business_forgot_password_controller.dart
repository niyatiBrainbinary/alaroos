import 'package:alaroos/Api_calling/auth/guest/forgot_password/forgot_password_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../Api_calling/auth/business/forgot_password/business_forgot_password_api.dart';
import '../../../../Utils/string.dart';
import '../../../Select_Language/select_language.dart';

class BusinessForgotController extends GetxController {
  TextEditingController forgotEmailController = TextEditingController();
  String forgotEmail = "";

  void setForgotEmail(String value) {
    forgotEmail = value.trim();
  }

  RxBool isLoading = false.obs;

  businessForgotPassword({email}) async {
    isLoading.value = true;
    await BusinessForgotPasswordApi.businessForgotPasswordApi(email: email);
    isLoading.value = false;
  }

  validateForgotEmail() {
    final emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$',
    );
    if (forgotEmailController.text.trim() == "") {
      forgotEmail = Strings.emailErrorRegister;
    } else if (!emailRegex.hasMatch(forgotEmail)) {
      forgotEmail = Strings.emailErrorRegister1;
    } else {
      forgotEmail = "";
    }
    update(['forgot_password']);
  }

  val() async {
    validateForgotEmail();
  }

   validation() {
    // validateForgotEmail();
val();
    if (forgotEmail == '' && forgotEmail == '') {
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
