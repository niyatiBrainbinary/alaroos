import 'package:alaroos/Api_calling/auth/guest/forgot_password/forgot_password_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../Utils/string.dart';
import '../../../Select_Language/select_language.dart';

class Forgot_Pass_Controller extends GetxController {
  TextEditingController fogotEmailController = TextEditingController();
  String forgotEmail = "";

  void setForgotEmail(String value) {
    forgotEmail = value.trim();
  }

  RxBool isLoading = false.obs;

  forgotPassword({email}) async {
    isLoading.value = true;
    await ForgotPasswordApi.forgotPasswordApi(email: email);
    isLoading.value = false;
  }

  validateForgotEmail() {
    final emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$',
    );
    if (fogotEmailController.text.trim() == "") {
      forgotEmail = Strings.emailErrorRegister;
    } else if (!emailRegex.hasMatch(forgotEmail)) {
      forgotEmail = Strings.emailErrorRegister1;
    } else {
      forgotEmail = "";
    }
    update(['forgot_email']);
  }

  bool validation() {
   // validateForgotEmail();

    if (forgotEmail == '' && forgotEmail == '') {
      return true;
    } else {
      return false;
    }
  }

  onTapForgotEmail() {
    if (validation()) {
      Get.to(() => Select_Language());
    }
  }
}
