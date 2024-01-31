import 'package:alaroos/Common/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alaroos/Screen/Auth/Guest_Auth/change_password/change_password_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Common/common_btn.dart';
import '../../../../Common/text_style.dart';
import '../../../../Utils/string.dart';
import '../../../../Common/common_btn.dart';
import '../../../../Common/text_filed.dart';
import 'business_change_password_controller.dart';

class BusinessChangePasswordScreen extends StatelessWidget {
   BusinessChangePasswordScreen({super.key});

   BusinessChangePasswordController businessChangePasswordController = Get.put(BusinessChangePasswordController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BusinessChangePasswordController>(
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
          body: Stack(
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
                          controller: businessChangePasswordController.passwordController,
                          onChange: (val) {
                            businessChangePasswordController.password = val;
                          },
                          keyboardType: TextInputType.visiblePassword,
                        ),
                      ),
                      businessChangePasswordController.password.isNotEmpty
                          ? Text(businessChangePasswordController.password, style: errorStyle)
                          : SizedBox(),
                      SizedBox(
                        height: Get.height*0.08,
                      ),
                      SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: CommonTextField(isObSecure: true,
                          title: Strings.changePassword,
                          controller: businessChangePasswordController.confirmPasswordController,
                          onChange: (val) {
                            businessChangePasswordController.password = val;
                          },
                          keyboardType: TextInputType.visiblePassword,
                        ),
                      ),
                      businessChangePasswordController.confirmPassword.isNotEmpty
                          ? Text(businessChangePasswordController.confirmPassword, style: errorStyle)
                          : SizedBox(),
                      SizedBox(
                        height: Get.height * 0.04,
                      ),
                      CommonBtn(
                        onTap: (){
                          if(businessChangePasswordController.validation()){
                            businessChangePasswordController.changePasswordApi(password: businessChangePasswordController.passwordController.text);
                          }
                        },
                          title: Strings.send)
                    ],
                  ),
                ),
              ),
              Obx(() => businessChangePasswordController.isLoading.value ? Loader() : SizedBox())
            ],
          ),
        );
      },
    );
  }
}
