import 'package:alaroos/Common/loader.dart';
import 'package:alaroos/Screen/Auth/Guest_Auth/Guest_Register/guest_register_screen.dart';
import 'package:alaroos/Screen/Auth/Guest_Auth/Guest_login/guest_login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Common/common_btn.dart';
import '../../../../Common/text_filed.dart';
import '../../../../Common/text_style.dart';
import '../../../../Utils/assets_res.dart';
import '../../../../Utils/color_res.dart';
import '../../../../Utils/string.dart';
import '../Forgot_Password/ForgotPassword.dart';

class GuestLoginScreen extends StatelessWidget {
  const GuestLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GuestLoginController guestLoginController = Get.put(GuestLoginController());
    return Scaffold(
      body: GetBuilder<GuestLoginController>(
        id: 'guest_login',
        builder: (controller) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Form(
                key: guestLoginController.guestLogin,
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
                        title: Strings.email,
                        controller: guestLoginController.emailController,
                        onChange: (val) {
                          guestLoginController.email = val;
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    guestLoginController.email.isNotEmpty
                        ? Text(guestLoginController.email, style: errorStyle)
                        : SizedBox(),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: CommonTextField(isObSecure: true,
                        title: Strings.password,
                        controller: guestLoginController.passwordController,
                        onChange: (val) {
                          guestLoginController.password = val;
                        },
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ),
                    guestLoginController.password.isNotEmpty
                        ? Text(guestLoginController.password, style: errorStyle)
                        : SizedBox(),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => ForgotPassword());
                      },
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          Strings.forgotPassword,
                          style: register,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    CommonBtn(
                      title: Strings.signin,
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        if(guestLoginController.validation()){
                          guestLoginController.guestLoginApi(
                            email: guestLoginController.emailController.text,
                            password: guestLoginController.passwordController.text
                          );
                        }
                       // guestLoginController.onTapLogIn();
                      },
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Strings.donthaveaccount,
                          style: donthaveac,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => GuestRegisterScreen());
                          },
                          child: Text(
                            Strings.register,
                            style: register,
                          ),
                        ),
                      ],
                    ),
                  //  Obx(() => controller.isLoading.value ? Loader() : SizedBox())
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
