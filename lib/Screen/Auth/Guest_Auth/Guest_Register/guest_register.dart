import 'package:alaroos/Common/common_btn.dart';
import 'package:alaroos/Screen/Auth/Business_Auth/Business_Register/register_controller.dart';
import 'package:alaroos/Screen/Auth/Guest_Auth/Guest_login/guest_login_controller.dart';
import 'package:alaroos/Screen/Home_Screen/home_screen.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Common/text_filed.dart';
import '../../../../Common/text_style.dart';
import '../../../../Utils/assets_res.dart';
import '../../../../Utils/string.dart';
import 'guest_register_controller.dart';

class GuestRegisterScreen extends StatelessWidget {
  GuestRegisterScreen({Key? key}) : super(key: key);
  GuestRegisterController guestRegisterController =
      Get.put(GuestRegisterController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GuestRegisterController>(
      id: 'guest_register',
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
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
              child: Form(
                key: guestRegisterController.guestRegisterForm,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: Get.height * 0.185,
                        width: Get.width * 0.55,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AssetsRes.registation),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: CommonTextField(
                        title: Strings.firstName,
                        controller: guestRegisterController.firstNameController,
                        onChange: guestRegisterController.setFirstName,
                        keyboardType: TextInputType.text,

                        // validator:
                        //     businessRegisterController.validateBusinessName(),
                      ),
                    ),
                    guestRegisterController.firstName.isNotEmpty
                        ? Text(
                            guestRegisterController.firstName,
                            style: errorStyle,
                            textAlign: TextAlign.start,
                          )
                        : SizedBox(),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: CommonTextField(
                        title: Strings.lastName,
                        controller: guestRegisterController.lastNameController,
                        onChange: guestRegisterController.setLastName,
                        keyboardType: TextInputType.text,

                        // validator:
                        //     businessRegisterController.validateUserName(),
                      ),
                    ),
                    guestRegisterController.lastName.isNotEmpty
                        ? Text(guestRegisterController.lastName,
                            style: errorStyle)
                        : SizedBox(),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: CommonTextField(
                        title: Strings.email,
                        controller: guestRegisterController.emailController,
                        onChange: guestRegisterController.setEmail,
                        keyboardType: TextInputType.emailAddress,
                        // validator: businessRegisterController.validateEmail(),
                      ),
                    ),
                    guestRegisterController.email.isNotEmpty
                        ? Text(guestRegisterController.email, style: errorStyle)
                        : SizedBox(),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: CommonTextField(
                        title: Strings.password,
                        controller: guestRegisterController.passwordController,
                        onChange: guestRegisterController.setPassword,
                        isObSecure: true,
                        keyboardType: TextInputType.visiblePassword,
                        // validator:
                        //     businessRegisterController.validatePassword(),
                      ),
                    ),
                    guestRegisterController.password.isNotEmpty
                        ? Text(guestRegisterController.password,
                            style: errorStyle)
                        : SizedBox(),
                    SizedBox(
                      height: Get.height * 0.06,
                    ),
                    CommonBtn(
                        onTap: () async {
                          guestRegisterController.onTapSignUp();
                        },
                        title: Strings.register),
                    SizedBox(
                      height: Get.height * 0.06,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
