import 'dart:convert';

import 'package:alaroos/Api_calling/auth/Business_Login_Api/Business_login_model/business_login_model.dart';
import 'package:alaroos/Screen/Home_Screen/home_screen.dart';
import 'package:alaroos/Utils/api_res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../Api_calling/auth/Business_Login_Api/business_login_api.dart';
import '../../../../Common/toast.dart';
import '../../../../Utils/pref_key.dart';
import '../../../../Utils/string.dart';
import '../../../../service/pref_service.dart';
import '../../../Category_select_Screen/category_screen.dart';
import '../../../Dashboard/Widgets/bottom_bar.dart';
import '../../../Dashboard/dashboard.dart';
import '../../../Select_Language/select_language.dart';

class BusinessLoginController extends GetxController {
  final GlobalKey<FormState> loginForm = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String email = "";
  String pass = "";

  RxBool isLoading = false.obs;
  BusinessLoginModel businessLoginModel =BusinessLoginModel();

  Future<bool> BusinessLoginApi({email,password})
  async {
    isLoading.value = true;
    businessLoginModel =  await LoginApi.loginApi(email: email,password: password, userType: '');
    PrefService.setValue(PrefKeys.registerToken, businessLoginModel.data!.id);
    PrefService.setValue(PrefKeys.firstName, businessLoginModel.data!.firstname);
    PrefService.setValue(PrefKeys.lastName, businessLoginModel.data!.lastname);
    PrefService.setValue(PrefKeys.email, businessLoginModel.data!.email);
    PrefService.setValue(PrefKeys.employeeId, businessLoginModel.data!.phone);
    PrefService.setValue(PrefKeys.mobileNumber, businessLoginModel.data!.token);
    isLoading.value = false;
    return  isLoading.value;
  }




  emailValidation() {
    if (emailController.text.trim() == "") {
      email = Strings.emailError;
    } else {
      if (RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(emailController.text)) {
        email = '';
      } else {
        email = Strings.emailError1;
      }
    }
    update(['business_login']);
  }

  passwordValidation() {
    if (passController.text.trim() == "") {
      pass = Strings.errorPass;
    } else if (passController.text.length < 1) {
      pass = Strings.errorPass1;
    } else {
      pass = '';
    }
    update(['business_login']);
  }

  bool validation() {
    emailValidation();
    passwordValidation();

    if (email == '' && pass == '') {
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
  //
  // loginApi({required String email, required String password,required String userType}) async{
  //   loader.value = true;
  //
  //   if(userType == "businessUser"){
  //     try{
  //
  //       BusinessLoginModel = await LoginApi.loginApi(email: email, password: password, userType: userType);
  //
  //       loader.value = false;
  //
  //       if(loginConsumerModel.responsecode == 200 && loginConsumerModel.message == "user found"){
  //
  //         // for(int i = 0; i<loginConsumerModel.user!.length ; i++){
  //         //   PrefService.setValue(PrefKeys.userIDorConsumerID, loginConsumerModel.user![i].id.toString());
  //         //   PrefService.setValue(PrefKeys.uniqueId, loginConsumerModel.user![i].uniqueId);
  //         //   PrefService.setValue(PrefKeys.customerID, loginConsumerModel.user![i].customerId);
  //         //   PrefService.setValue(PrefKeys.customerName, loginConsumerModel.user![i].customerName);
  //         //   PrefService.setValue(PrefKeys.emailAddress, loginConsumerModel.user![i].emailAddress);
  //         //   PrefService.setValue(PrefKeys.customerContact, loginConsumerModel.user![i].customerContact);
  //         //   PrefService.setValue(PrefKeys.customerGender, loginConsumerModel.user![i].customerGender);
  //         //   PrefService.setValue(PrefKeys.customerAddress, loginConsumerModel.user![i].customerAddress);
  //         //   PrefService.setValue(PrefKeys.customerPassword, loginConsumerModel.user![i].customerPassword);
  //         // }
  //
  //         showToast(Strings.success);
  //
  //
  //         // if(PrefService.getInt(PrefKeys.isChengScreen)==0)
  //         // {
  //         //   PrefService.setValue(PrefKeys.isConsumer, true);
  //         //   Get.to(StoreListScreen());
  //         // }
  //
  //         /// important - not remove
  //         // if(PrefService.getInt(PrefKeys.isChengScreen)==0)
  //         // {
  //         //   PrefService.setValue(PrefKeys.isConsumer, true);
  //         //   Get.to(StoreListScreen());
  //         // }
  //         // else if(PrefService.getInt(PrefKeys.isChengScreen)==1)
  //         // {
  //         //   PrefService.setValue(PrefKeys.isMerchant, true);
  //         //   Get.to(StoreListScreen());
  //         // }
  //         // else if(PrefService.getInt(PrefKeys.isChengScreen)==2)
  //         // {
  //         //   PrefService.setValue(PrefKeys.isStaff, true);
  //         //   Get.to(StaffHomeScreen());
  //         // }
  //         // else if(PrefService.getInt(PrefKeys.isChengScreen)==3)
  //         // {
  //         //   PrefService.setValue(PrefKeys.isDelivery, true);
  //         //   Get.to(DeliveryHomeScreen());
  //         // }
  //
  //       } else {
  //         errorToast("${loginConsumerModel.message}");
  //       }
  //
  //
  //
  //     } catch (e){
  //       loader.value = false;
  //       errorToast("User not found");
  //     }
  //   }
  // }
}
