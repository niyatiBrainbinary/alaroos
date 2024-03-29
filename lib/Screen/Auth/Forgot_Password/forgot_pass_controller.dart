import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../Utils/string.dart';
import '../../Category_select_Screen/category_screen.dart';
import '../../Dashboard/Widgets/bottom_bar.dart';
import '../../Dashboard/dashboard.dart';
import '../../Home_Screen/home_screen.dart';
import '../../Select_Language/select_language.dart';

class Forgot_Pass_Controller extends GetxController {
  TextEditingController fogotEmailController = TextEditingController();
  String forgotEmail = "";

  void setForgotEmail(String value) {
    forgotEmail = value.trim();
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
    validateForgotEmail();

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
