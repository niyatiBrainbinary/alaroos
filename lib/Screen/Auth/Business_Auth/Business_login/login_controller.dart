import 'dart:convert';

import 'package:alaroos/Screen/Home_Screen/home_screen.dart';
import 'package:alaroos/Utils/api_res.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../Api_calling/auth/business/Business_Login_Api/Business_login_model/business_login_model.dart';
import '../../../../Api_calling/auth/business/Business_Login_Api/business_login_api.dart';
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
  String emailError = "";
  String passwordError = "";

  RxBool isLoading = false.obs;
  BusinessLoginModel businessLoginModel =BusinessLoginModel();

  businessLoginApi({email,password})
  async {
    isLoading.value = true;
    businessLoginModel =  await LoginApi.loginApi(email: email,password: password, userType: '');
    if(businessLoginModel.data!=null) {
      await PrefService.setValue(
          PrefKeys.registerToken, businessLoginModel.data!.token);
      PrefService.setValue(
          PrefKeys.firstNameBusiness, businessLoginModel.data?.firstname);
      PrefService.setValue(
          PrefKeys.lastNameBusiness, businessLoginModel.data?.lastname);
      PrefService.setValue(
          PrefKeys.emailBusiness, businessLoginModel.data?.email);
      PrefService.setValue(
          PrefKeys.mobileNumberBusiness, businessLoginModel.data?.phone);
      PrefService.setValue(
          PrefKeys.employeeId, businessLoginModel.data?.id);
      PrefService.setValue(PrefKeys.type, "business");


      bool isUpdate = false;
      String docId = '';
      var bussinessData = await FirebaseFirestore.instance.collection("Auth")
          .doc("Business").collection("BusinessEntry")
          .get();
      bussinessData.docs.forEach((element) {
        if (element['bussinessEmail'] == businessLoginModel.data?.email) {
          isUpdate = true;
          docId = element.id;
        }
      });

      if (isUpdate) {
        await FirebaseFirestore.instance.collection("Auth").doc("Business")
            .collection("BusinessEntry").doc(docId)
            .update({
          "firstName": businessLoginModel.data?.firstname,
          "lastName": businessLoginModel.data?.lastname,
          "businessName": businessLoginModel.data?.businessname,
          "businessEmail": businessLoginModel.data?.email,
          "businessPhone": businessLoginModel.data?.phone,
        });
      }
      else {
        await FirebaseFirestore.instance.collection("Auth")
            .doc("Business")
            .collection("BusinessEntry")
            .add({
          "firstName": businessLoginModel.data?.firstname,
          "lastName": businessLoginModel.data?.lastname,
          "businessName": businessLoginModel.data?.businessname,
          "businessEmail": businessLoginModel.data?.email,
          "businessPhone": businessLoginModel.data?.phone,
        });
      }
    }

    isLoading.value = false;
  }

  emailValidation() {
    update(['business_login']);
    if (emailController.text.trim() == "") {
      // errorToast(StringRes.enterEmailError.tr);
      emailError = Strings.emailError;
      update(['business_login']);
      return false;
    } else {
      if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(emailController.text)) {
        emailError = '';
        update(['business_login']);
        return true;
      } else {
        // errorToast(StringRes.enterValidEmail.tr);
        emailError = Strings.emailError1;
        update(['business_login']);
        return false;
      }
    }
  }

  passwordValidation() {
    if (passController.text.trim() == "") {
      // errorToast(StringRes.enterPasswordError.tr);
      passwordError = Strings.errorPass;
      update(['logIn']);
      return false;
    } else {
      if (passController.text.trim().length >= 1) {
        passwordError = '';
        update(['logIn']);
        return true;
      } else {
        // errorToast(StringRes.passwordMustBe.tr);
        passwordError = Strings.errorPass1;
        update(['logIn']);
        return false;
      }
    }
  }

   validation() {
    val();

    if (emailError == '' && passwordError == '') {
      return true;
    } else {
      return false;
    }
  }
  val() async {
    emailValidation();
    passwordValidation();
  }

  /*onTapLogIn() {
    if (validation()) {
      Get.to(() => Select_Language());
    }
  }*/
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
