import 'package:alaroos/Screen/Auth/Guest_Auth/reset_password/reset_password_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../Common/common_btn.dart';
import '../../../../Common/loader.dart';
import '../../../../Common/text_filed.dart';
import '../../../../Common/text_style.dart';
import '../../../../Utils/assets_res.dart';
import '../../../../Utils/string.dart';

class ResetPasswordScreen extends StatelessWidget {
   ResetPasswordScreen({super.key});

  final ResetPasswordController resetPasswordController = Get.put(ResetPasswordController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResetPasswordController>(
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
                            controller: resetPasswordController.passwordController,
                            onChange: (val) {
                              resetPasswordController.password = val;
                            },
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        ),
                        resetPasswordController.password.isNotEmpty
                            ? Text(resetPasswordController.password, style: errorStyle)
                            : SizedBox(),
                        SizedBox(
                          height: Get.height*0.08,
                        ),
                        SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: CommonTextField(isObSecure: true,
                            title: Strings.changePassword,
                            controller: resetPasswordController.confirmPasswordController,
                            onChange: (val) {
                              resetPasswordController.password = val;
                            },
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        ),
                        resetPasswordController.confirmPassword.isNotEmpty
                            ? Text(resetPasswordController.confirmPassword, style: errorStyle)
                            : SizedBox(),
                        SizedBox(
                          height: Get.height * 0.04,
                        ),
                        CommonBtn(
                            onTap: (){
                              if(resetPasswordController.validation()){
                                resetPasswordController.changePasswordApi(password: resetPasswordController.passwordController.text);
                              }
                            },
                            title: Strings.send)
                      ],
                    ),
                  ),
                ),
                Obx(() => resetPasswordController.isLoading.value ? Loader() : SizedBox())
              ],
            ),
          ),
        );
      },
    );
  }
}
