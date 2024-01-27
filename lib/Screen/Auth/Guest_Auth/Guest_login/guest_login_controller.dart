import 'package:alaroos/Api_calling/auth/guest/guest_login/guest_login_api.dart';
import 'package:alaroos/Api_calling/auth/guest/guest_login/guest_login_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Utils/pref_key.dart';
import '../../../../Utils/string.dart';
import '../../../../service/pref_service.dart';
import '../../../Category_select_Screen/category_screen.dart';
import '../../../Dashboard/Widgets/bottom_bar.dart';
import '../../../Select_Language/select_language.dart';

class GuestLoginController extends GetxController {
  final GlobalKey<FormState> guestLogin = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String email = "";

  @override
  void onInit() {
    guestLoginApi();
    // TODO: implement onInit
    super.onInit();
  }


  RxBool isLoading = false.obs;
  GuestLoginModel guestLoginModel =GuestLoginModel();

  guestLoginApi({email,password})
  async {
    isLoading.value = true;
    guestLoginModel =  await GuestLoginApi.guestLoginApi(email: email,password: password);
    PrefService.setValue(PrefKeys.registerToken, guestLoginModel.data?.token);
    PrefService.setValue(PrefKeys.firstName, guestLoginModel.data?.firstname);
    PrefService.setValue(PrefKeys.lastName, guestLoginModel.data?.lastname);
    PrefService.setValue(PrefKeys.email, guestLoginModel.data?.email);
    PrefService.setValue(PrefKeys.employeeId, guestLoginModel.data?.id);
    isLoading.value = false;
  }


  void setEmail(String value) {
    email = value.trim();
  }

  emailValidation() {
    if (emailController.text.trim() == "") {
      email = Strings.guestEmailError;
    } else {
      if (RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(emailController.text)) {
        email = '';
      } else {
        email = Strings.emailError1;
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
      password = Strings.guestErrorPass;
    } else if (passwordController.text.length < 1) {
      password = Strings.errorPass1;
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
