import 'package:alaroos/Common/common_btn.dart';
import 'package:alaroos/Common/text_filed.dart';
import 'package:alaroos/Common/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Utils/assets_res.dart';
import '../../../../Utils/string.dart';
import '../../Guest_Auth/Forgot_Password/forgot_pass_controller.dart';
import 'business_forgot_password_controller.dart';


import 'package:alaroos/Common/common_btn.dart';
import 'package:alaroos/Common/text_filed.dart';
import 'package:alaroos/Common/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Utils/assets_res.dart';
import '../../../../Utils/string.dart';



class ForgotPasswords extends StatelessWidget {
  ForgotPasswords({Key? key}) : super(key: key);


  final BusinessForgotController businessForgotPasswordController =
  Get.put(BusinessForgotController());


  @override
  Widget build(BuildContext context) {
    return GetBuilder<BusinessForgotController>(
      id: 'forgot_password',
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              Strings.forgot,
              style: forgotPass,
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(CupertinoIcons.back),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: Get.height * 0.2,
                      width: Get.width * 0.75,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AssetsRes.forgot),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.06,
                  ),
                  Container(
                    height: Get.height * 0.08,
                    width: Get.width * 0.8,
                    decoration: const BoxDecoration(),
                    child: Text(
                      Strings.details,
                      textAlign: TextAlign.center,
                      style: forgotDetails,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.08,
                  ),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: CommonTextField(
                      title: Strings.email,
                      onChange: businessForgotPasswordController.setForgotEmail,
                      controller: businessForgotPasswordController.forgotEmailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  /*forgot_pass_controller.forgotEmail.isNotEmpty
                      ? Text(forgot_pass_controller.forgotEmail,
                          style: errorStyle)
                      : SizedBox(),*/
                  SizedBox(
                    height: Get.height * 0.04,
                  ),
                  CommonBtn(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        // controller.fogotEmailController.clear();
                        if(controller.validation()){
                          controller.businessForgotPassword(email: controller.forgotEmailController.text);
                        }

                      //  businessForgotPasswordController.onTapForgotEmail();
                      },
                      title: Strings.send)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


class tinas extends StatelessWidget {
   tinas({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}



/*
class BusinessForgotPasswordScreen extends StatelessWidget {
  BusinessForgotPasswordScreen({super.key});
  final BusinessForgotPasswordController businessForgotPasswordController = BusinessForgotPasswordController();


  @override
  Widget build(BuildContext context) {

  return Scaffold(
    appBar: AppBar(
      title: Text(
        Strings.forgot,
        style: forgotPass,
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(CupertinoIcons.back),
      ),
    ),
    body: Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: Get.height * 0.2,
                  width: Get.width * 0.75,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AssetsRes.forgot),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.06,
              ),
              Container(
                height: Get.height * 0.08,
                width: Get.width * 0.8,
                decoration: const BoxDecoration(),
                child: Text(
                  Strings.details,
                  textAlign: TextAlign.center,
                  style: forgotDetails,
                ),
              ),
              SizedBox(
                height: Get.height * 0.08,
              ),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: CommonTextField(
                  title: Strings.email,
                  onChange: businessForgotPasswordController.setForgotEmail,
                  controller: businessForgotPasswordController.forgotEmailController,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              */
/*  forgot_pass_controller.forgotEmail.isNotEmpty
              ? Text(forgot_pass_controller.forgotEmail,
                  style: errorStyle)
              : SizedBox(),*//*

              SizedBox(
                height: Get.height * 0.04,
              ),
              CommonBtn(
                  onTap: ()  {
                    FocusScope.of(context).unfocus();
                    // controller.fogotEmailController.clear();
                    businessForgotPasswordController.businessForgotPassword(
              email: businessForgotPasswordController.forgotEmailController.text
              );
                    businessForgotPasswordController.onTapForgotEmail();
                  },
                  title: Strings.send)
            ],
          ))
      ,
    )

  );
  }
}


*/
