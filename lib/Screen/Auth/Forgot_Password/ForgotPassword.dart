import 'package:alaroos/Common/common_btn.dart';
import 'package:alaroos/Common/text_filed.dart';
import 'package:alaroos/Common/text_style.dart';
import 'package:alaroos/Screen/Auth/Forgot_Password/forgot_pass_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/assets_res.dart';
import '../../../Utils/string.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);
  Forgot_Pass_Controller forgot_pass_controller =
      Get.put(Forgot_Pass_Controller());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Forgot_Pass_Controller>(
      id: 'forgot_email',
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
                      onChange: forgot_pass_controller.setForgotEmail,
                      controller: forgot_pass_controller.fogotEmailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  forgot_pass_controller.forgotEmail.isNotEmpty
                      ? Text(forgot_pass_controller.forgotEmail,
                          style: errorStyle)
                      : SizedBox(),
                  SizedBox(
                    height: Get.height * 0.04,
                  ),
                  CommonBtn(
                      onTap: () {
                        forgot_pass_controller.onTapForgotEmail();
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
