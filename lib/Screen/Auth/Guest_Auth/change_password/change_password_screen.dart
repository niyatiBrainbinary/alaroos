import 'package:alaroos/Screen/Auth/Guest_Auth/Guest_login/gusest_login.dart';
import 'package:alaroos/Screen/Auth/Guest_Auth/change_password/change_password_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alaroos/Screen/Auth/Guest_Auth/verify_otp/verify_otp_controller.dart';
import 'package:alaroos/Utils/pref_key.dart';
import 'package:alaroos/service/pref_service.dart';
import 'package:flutter/material.dart';
import 'package:alaroos/Screen/Auth/Guest_Auth/reset_password/reset_password_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../Common/common_btn.dart';
import '../../../../Common/loader.dart';
import '../../../../Common/text_style.dart';
import '../../../../Utils/string.dart';
import '../../../../Common/common_btn.dart';
import '../../../../Common/text_filed.dart';
import '../../../../Common/text_style.dart';
import '../../../../Utils/string.dart';

class ChangePasswordScreen extends StatelessWidget {
   ChangePasswordScreen({super.key});

   ChangePasswordController changePasswordController = Get.put(ChangePasswordController());

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<ChangePasswordController>(
      id: 'change_password',
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              Strings.changePassword,
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
          body: GestureDetector(
            onTap: (){
              FocusScope.of(context).unfocus();
            },
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Get.height * 0.08,
                        ),
                        SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: CommonTextField(isObSecure: true,
                            title: Strings.password,
                            controller: changePasswordController.passwordController,
                            onChange: (val) {
                              changePasswordController.password = val;
                            },
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        ),
                        changePasswordController.password.isNotEmpty
                            ? Text(changePasswordController.password, style: errorStyle)
                            : SizedBox(),
                        SizedBox(
                          height: Get.height*0.08,
                        ),
                        SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: CommonTextField(isObSecure: true,
                            title: Strings.changePassword,
                            controller: changePasswordController.confirmPasswordController,
                            onChange: (val) {
                              changePasswordController.password = val;
                            },
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        ),
                        changePasswordController.confirmPassword.isNotEmpty
                            ? Text(changePasswordController.confirmPassword, style: errorStyle)
                            : SizedBox(),
                        SizedBox(
                          height: Get.height * 0.04,
                        ),
                        CommonBtn(
                            onTap: () {

                              if(changePasswordController.validation()){
                                changePasswordController.changePasswordApi(
                                    password: changePasswordController.passwordController.text
                                );
                                //Get.to(GuestLoginScreen());

                              }
                            },
                            title: Strings.send)
                      ],
                    ),
                  ),
                ),
                Obx(() => changePasswordController.isLoading.value ? const Loader() : const SizedBox())
              ],
            ),
          ),
        );
      },
    );
  }
}
