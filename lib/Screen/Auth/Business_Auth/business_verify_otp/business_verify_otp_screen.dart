import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../Common/common_btn.dart';
import '../../../../Common/loader.dart';
import '../../../../Common/text_style.dart';
import '../../../../Utils/string.dart';
import 'business_verify_otp_controller.dart';

class BusinessVerifyOtpScreen extends StatelessWidget {
   BusinessVerifyOtpScreen({super.key});

  final BusinessVerifyOtpController businessVerifyOtpController = Get.put(BusinessVerifyOtpController());


  @override
  Widget build(BuildContext context) {
    return GetBuilder<BusinessVerifyOtpController>(
      id: 'otp',
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
                        PinCodeTextField(
                          controller: controller.otpController,
                          appContext: context,
                          length: 6,
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
                        SizedBox(
                          height: Get.height * 0.04,
                        ),
                        CommonBtn(
                          onTap: (){
                            if(controller.otpError == ""){
                              controller.verifyOtp(
                                otp: controller.otpController.text
                              );
                            }
                          },
                           /* onTap: () {
                              controller.onTapSubmit();
                              if (controller.otpError == "") {
                                controller.verifyOtp(
                                    otp: controller.otpController.text);
                              }
                            },*/
                            title: Strings.send)
                      ],
                    ),
                  ),
                ),

                Obx(() => businessVerifyOtpController.isLoading.value ? const Loader() : const SizedBox())
              ],
            ),
          ),
        );

      },
    );

  }
}
