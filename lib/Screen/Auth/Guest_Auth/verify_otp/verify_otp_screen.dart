import 'package:alaroos/Screen/Auth/Guest_Auth/verify_otp/verify_otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:alaroos/Screen/Auth/Guest_Auth/reset_password/reset_password_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../Common/common_btn.dart';
import '../../../../Common/text_style.dart';
import '../../../../Utils/string.dart';

class VerifyOtpScreen extends StatelessWidget {
   VerifyOtpScreen({super.key});

  final VerifyOtpController verifyOtpController = Get.put(VerifyOtpController());

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<VerifyOtpController>(
      id: 'forgot_email',
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              Strings.otpVerification,
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
                  /*  Center(
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
                  ),*/
                  SizedBox(
                    height: Get.height * 0.08,
                  ),
                  PinCodeTextField(

                    appContext: context,
                    length: 4,
                    onChanged: (value) {
                      // Handle changes in the entered pin code
                      print(value);
                    },
                    onCompleted: (value) {
                      // Handle when the user completes entering the pin code
                      print("Completed: $value");
                    },
                    pinTheme: PinTheme(

                      shape: PinCodeFieldShape.underline,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                    ),
                  ),

                  /* SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: CommonTextField(
                      controller: ,
                      title: Strings.email,
                    //  onChange: forgot_pass_controller.setForgotEmail,
                      //controller: forgot_pass_controller.fogotEmailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),*/
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
