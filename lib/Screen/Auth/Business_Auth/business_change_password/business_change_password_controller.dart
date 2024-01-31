import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../Api_calling/auth/business/business_change_password/business_change_password_api.dart';
import '../../../../Api_calling/auth/business/business_change_password/business_change_passwrod_model.dart';
import '../../../../Utils/string.dart';

class BusinessChangePasswordController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  BusinessChangePasswordModel businessChangePasswordModel = BusinessChangePasswordModel();
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

    businessChangePasswordModel = await BusinessChangePasswordApi.businessChangePasswordApi(
        password: password);
    //  passwordController.text = changePasswordModel.data?.password??"";
    isLoading.value = false;
  }
}