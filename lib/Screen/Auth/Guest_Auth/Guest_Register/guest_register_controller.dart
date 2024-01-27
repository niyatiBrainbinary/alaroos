import 'package:alaroos/Screen/Home_Screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../Utils/string.dart';
import '../../../Category_select_Screen/category_screen.dart';
import '../../../Dashboard/Widgets/bottom_bar.dart';
import '../../../Dashboard/dashboard.dart';
import '../../../Select_Language/select_language.dart';

class GuestRegisterController extends GetxController {
  final GlobalKey<FormState> guestRegisterForm = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String firstName = "";

  void setFirstName(String value) {
    firstName = value.trim();
  }

  validateFirstName() {
    if (firstNameController.text.trim() == "") {
      firstName = Strings.firstNameErrorMessage.tr;
    } else {
      firstName = "";
    }
    update(['guest_register']);
  }

  String lastName = "";

  void setLastName(String value) {
    lastName = value.trim();
  }

  validateLastName() {
    if (lastNameController.text.trim() == "") {
      lastName = Strings.lastNanmeErrorMessage.tr;
    } else {
      lastName = "";
    }
    update(['guest_register']);
  }

  String email = "";

  void setEmail(String value) {
    email = value.trim();
  }

  validateEmail() {
    final emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$',
    );
    if (emailController.text.trim() == "") {
      email = Strings.emailErrorRegister.tr;
    } else if (!emailRegex.hasMatch(email)) {
      email = Strings.emailErrorRegister1.tr;
    } else {
      email = "";
    }
    update(['guest_register']);
  }

  String password = '';

  void setPassword(String value) {
    password = value.trim();
  }

  validatePassword() {
    if (passwordController.text.trim() == "") {
      password = Strings.passwordErrorMessage.tr;
    } else if (password.length < 8) {
      password = Strings.passwordErrorMessage1.tr;
    } else {
      password = "";
    }
    update(['guest_register']);
  }

  bool validationSignup() {
    validateFirstName();
    validateLastName();
    validateEmail();
    validatePassword();

    if (firstName == '' && lastName == '' && email == '' && password == '') {
      return true;
    } else {
      return false;
    }
  }

  onTapSignUp() {
    if (validationSignup()) {
      Get.to(() => Select_Language());
    }
  }
}
