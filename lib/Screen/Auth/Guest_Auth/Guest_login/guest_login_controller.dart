import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Utils/string.dart';
import '../../../Category_select_Screen/category_screen.dart';
import '../../../Dashboard/Widgets/bottom_bar.dart';
import '../../../Select_Language/select_language.dart';

class GuestLoginController extends GetxController {
  final GlobalKey<FormState> guestLogin = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String email = "";

  void setEmail(String value) {
    email = value.trim();
  }

  emailValidation() {
    if (emailController.text.trim() == "") {
      email = Strings.guestEmailError.tr;
    } else {
      if (RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(emailController.text)) {
        email = '';
      } else {
        email = Strings.emailError1.tr;
      }
    }
    update(['guest_login']);
  }

  String password="";

  void setPassword(String value) {
    password = value.trim();
  }

  passwordValidation() {
    if (passwordController.text.trim() == "") {
      password = Strings.guestErrorPass.tr;
    } else if (passwordController.text.length < 8) {
      password = Strings.errorPass1.tr;
    } else {
      password = '';
    }
    update(['guest_login']);
  }

  bool validation() {
    emailValidation();
    passwordValidation();

    if (email == '' && password == '') {
      return true;
    } else {
      return false;
    }
  }

  onTapLogIn() {
    if (validation()) {
      Get.to(() => Select_Language());
    }
  }
}
