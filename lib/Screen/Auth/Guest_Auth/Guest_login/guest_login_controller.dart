import 'package:alaroos/Api_calling/auth/guest/guest_login/guest_login_api.dart';
import 'package:alaroos/Api_calling/auth/guest/guest_login/guest_login_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  String password = "";
  String emailError = "";
  String passwordError = "";

  @override
  void onInit() {

    super.onInit();
  }


  RxBool isLoading = false.obs;
  GuestLoginModel guestLoginModel =GuestLoginModel();

  guestLoginApi({email,password})
  async {
    isLoading.value = true;
    guestLoginModel =  await GuestLoginApi.guestLoginApi(email: email,password: password);
   /* PrefService.setValue(PrefKeys.registerToken, guestLoginModel.data?.token);
    PrefService.setValue(PrefKeys.guestLogin, true);
    PrefService.setValue(PrefKeys.firstName, guestLoginModel.data?.firstname);
    PrefService.setValue(PrefKeys.lastName, guestLoginModel.data?.lastname);
    PrefService.setValue(PrefKeys.email, guestLoginModel.data?.email);
    PrefService.setValue(PrefKeys.employeeId, guestLoginModel.data?.id);*/
    PrefService.setValue(PrefKeys.type,"user");

    bool isUpdate = false;
    String docId ='';
    if( guestLoginModel.data?.email != null) {
      var bussinessData = await FirebaseFirestore.instance.collection("Auth")
          .doc("User").collection("UserEntry")
          .get();
      bussinessData.docs.forEach((element) {
        if (element['email'] == guestLoginModel.data?.email) {
          isUpdate = true;
          docId = element.id;
        }
      });

      if (isUpdate) {
        await FirebaseFirestore.instance.collection("Auth").doc("User")
            .collection("UserEntry").doc(docId)
            .update({
          "firstName": guestLoginModel.data?.firstname,
          "lastName": guestLoginModel.data?.lastname,
          "email": guestLoginModel.data?.email,
        });
      }
      else {
        await FirebaseFirestore.instance.collection("Auth")
            .doc("User")
            .collection("UserEntry")
            .add({
          "firstName": guestLoginModel.data?.firstname,
          "lastName": guestLoginModel.data?.lastname,
          "email": guestLoginModel.data?.email,
        });
      }
    }

    isLoading.value = false;

  }

  emailValidation() {
    update(['logIn']);
    if (emailController.text.trim() == "") {
      // errorToast(StringRes.enterEmailError.tr);
      emailError = Strings.guestEmailError.tr;
      update(['logIn']);
      return false;
    } else {
      if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(emailController.text)) {
        emailError = '';
        update(['logIn']);
        return true;
      } else {
        // errorToast(StringRes.enterValidEmail.tr);
        emailError = Strings.emailError1.tr;
        update(['logIn']);
        return false;
      }
    }
  }

  passwordValidation() {
    if (passwordController.text.trim() == "") {
      passwordError = Strings.guestErrorPass;  update(['guest_login']);
    } else if (passwordController.text.length < 1) {
      passwordError = Strings.errorPass1;  update(['guest_login']);
    } else {
      passwordError = '';  update(['guest_login']);
    }

  }
val() async {
  emailValidation();
  passwordValidation();

}
   validation() {
  val();
    if (emailError == '' && passwordError == '') {
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
