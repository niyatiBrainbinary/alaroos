import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../Api_calling/auth/business/business_change_password/business_change_password_api.dart';
import '../../../../Api_calling/auth/business/business_change_password/business_change_passwrod_model.dart';
import '../../../../Api_calling/auth/guest/change_password/change_password_api.dart';
import '../../../../Api_calling/auth/guest/change_password/change_password_model.dart';
import '../../../../Utils/string.dart';

class ResetPasswordController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  ChangePasswordModel changePasswordModel = ChangePasswordModel();
  RxBool isLoading = false.obs;

  String password = "";
  String confirmPassword = "";

  String passwordError = "";
  String confirmPasswordError = "";

  passwordValidation (){
    if(passwordController.text.trim() == ""){
      password = Strings.passwordValidation;
    } else {
      password = "";
    }
    update(['change_password']);
  }

  confirmPasswordValidation (){
    if(confirmPasswordController.text.trim() == ""){
      confirmPassword = Strings.confirmPasswordValidation;
    } else if(passwordController.text.trim() != confirmPasswordController.text.trim()){
      confirmPassword = Strings.notMatch;
    }else {
      confirmPassword = "";
    }
    update(['change_password']);
  }
  val()async{
    passwordValidation();
    confirmPasswordValidation();
  }
  validation(){
    val();
    if(password == '' && confirmPassword == ''){
      return true;
    }else {
      return false;
    }
  }

  Future changePasswordApi({ required String password}) async {
    isLoading.value = true;

    changePasswordModel = await ChangePasswordApi.changePasswordApi(
        password: password);
    //  passwordController.text = changePasswordModel.data?.password??"";
    isLoading.value = false;
  }
}