import 'package:alaroos/Api_calling/auth/guest/guest_register/guest_register_api.dart';
import 'package:alaroos/Api_calling/auth/guest/guest_register/guest_register_model.dart';
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


  RxBool isLoading = false.obs;
  GuestRegisterModel guestRegisterModel = GuestRegisterModel();

  String firstName = "";
  String lastName = "";
  String emailAddress = "";
  String password = "";
  String firstNameError = "";
  String lastNameError = "";
  String emailAddressError = "";
  String passwordError = "";

  firstNameValidation (){
    if(firstNameController.text.trim() == ""){
      firstNameError = Strings.firstNameErrorMessage;
    }else {
      firstNameError = "";
    }
    update(['guest_register']);
  }

  lastNameValidation (){
    if(lastNameController.text.trim() == ""){
      lastNameError = Strings.lastNanmeErrorMessage;
    }else {
      lastNameError = "";
    }
    update(['guest_register']);
  }

  emailValidation() {
    update(['guest_register']);
    if (emailController.text.trim() == "") {
      // errorToast(StringRes.enterEmailError.tr);
      emailAddressError = Strings.emailErrorRegister.tr;
      update(['guest_register']);
      return false;
    } else {
      if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(emailController.text)) {
        emailAddressError = '';
        update(['guest_register']);
        return true;
      } else {
        // errorToast(StringRes.enterValidEmail.tr);
        emailAddressError = Strings.emailError1.tr;
        update(['guest_register']);
        return false;
      }
    }
  }

  passwordValidation() {
    if (passwordController.text.trim() == "") {
      passwordError = Strings.passwordErrorMessage;
      // } else if (password.length < 1) {
      //   passwordError = Strings.passwordErrorMessage1;
    } else {
      passwordError = "";
    }
    update(['guest_register']);
  }

  val() async {
    firstNameValidation();
    lastNameValidation();
    emailValidation();
    passwordValidation();
  }

  validation (){
    val();
    if(firstName == "" && lastName == "" && emailAddress == "" && password == ""){
      return true;
    } else {
       return false;
    }
  }



  guestRegister({password, firstName, lastName,email}) async {
    isLoading.value = true;
    await GuestRegisterApi.guestRegisterApi(password: password, firstName: firstName, lastName: lastName,email: email);
    isLoading.value = false;
  }

/*  bool validation() {
    validateFirstName();
    validateLastName();
    //validateEmail();
   // validatePassword();

    if (firstName == '' && lastName == '' && email == '' && password == '') {
      return true;
    } else {
      return false;
    }
  }*/

 /* onTapSignUp() {
    if (validation()) {
      Get.to(() => Select_Language());
    }
  }*/
}
