import 'package:alaroos/Common/text_style.dart';
import 'package:alaroos/Screen/Auth/Forgot_Password/forgot_pass.dart';
import 'package:alaroos/Screen/Home_Screen/home_screen.dart';
import 'package:alaroos/Utils/assets_res.dart';
import 'package:alaroos/Utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Common/common_btn.dart';
import '../../../../Common/text_filed.dart';
import '../../../../Utils/string.dart';
import '../Business_Register/register_screen.dart';
import 'login_controller.dart';

class Business_Login_Screen extends StatelessWidget {
  const Business_Login_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BusinessLoginController businessLoginController =
        Get.put(BusinessLoginController());
    return Scaffold(
      body: GetBuilder<BusinessLoginController>(
        id: 'business_login',
        builder: (controller) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Form(
                key: businessLoginController.loginForm,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height * 0.08,
                    ),
                    Center(
                      child: Container(
                        height: Get.height * 0.3,
                        width: Get.width * 0.55,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AssetsRes.login),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: CommonTextField(
                        title: Strings.businessEmail.tr,
                        controller: businessLoginController.emailController,
                        onChange: (val) {
                          businessLoginController.email = val;
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    businessLoginController.email.isNotEmpty
                        ? Text(businessLoginController.email, style: errorStyle)
                        : SizedBox(),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: CommonTextField(
                        title: Strings.password.tr,
                        controller: businessLoginController.passController,
                        isObSecure: true,
                        onChange: (val) {
                          businessLoginController.pass = val;
                        },
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ),
                    businessLoginController.pass.isNotEmpty
                        ? Text(businessLoginController.pass, style: errorStyle)
                        : SizedBox(),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => Forgot_Password_Screen());
                      },
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          Strings.forgotPassword.tr,
                          style: forgot,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    CommonBtn(
                      title: Strings.signin.tr,
                      onTap: () {FocusScope.of(context).unfocus();
                      if (businessLoginController.validation()) {
                        businessLoginController.BusinessLoginApi(
                            email: businessLoginController
                                .emailController.text,
                            password: businessLoginController
                                .passController.text)
                            .then((value) {
                          if (value == false) {
                            businessLoginController.emailController.clear();
                            businessLoginController.passController.clear();
                          }
                        });
                      }
                       businessLoginController.onTapLogIn();
                      },
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Strings.donthaveaccount.tr,
                          style: doNotAccount,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => BusinessRegisterScreen());
                          },
                          child: Text(
                            Strings.register.tr,
                            style: registerPoppins,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      backgroundColor: ColorRes.themeColor,
    );
  }
}
