import 'package:alaroos/Common/common_btn.dart';
import 'package:alaroos/Screen/Auth/Business_Auth/Business_Register/register_controller.dart';
import 'package:alaroos/Screen/Home_Screen/home_screen.dart';
import 'package:alaroos/Utils/color_res.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Common/text_filed.dart';
import '../../../../Common/text_style.dart';
import '../../../../Utils/assets_res.dart';
import '../../../../Utils/string.dart';

class BusinessRegisterScreen extends StatelessWidget {
  BusinessRegisterScreen({Key? key}) : super(key: key);
  BusinessRegisterController businessRegisterController =
      Get.put(BusinessRegisterController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BusinessRegisterController>(
      id: 'business_register',
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(backgroundColor: ColorRes.themeColor,
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
                key: businessRegisterController.signupForm,
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
                        title: Strings.userName.tr,
                        controller:
                            businessRegisterController.userNameController,
                        onChange: businessRegisterController.setUserName,
                        keyboardType: TextInputType.text,

                        // validator:
                        //     businessRegisterController.validateUserName(),
                      ),
                    ),
                    businessRegisterController.userName.isNotEmpty
                        ? Text(businessRegisterController.userName,
                            style: errorStyle)
                        : SizedBox(),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: CommonTextField(
                        title: Strings.businessName.tr,
                        controller:
                            businessRegisterController.businessNameController,
                        onChange: businessRegisterController.setBusinessName,
                        keyboardType: TextInputType.text,

                        // validator:
                        //     businessRegisterController.validateBusinessName(),
                      ),
                    ),
                    businessRegisterController.businessName.isNotEmpty
                        ? Text(businessRegisterController.businessName,
                            style: errorStyle)
                        : SizedBox(),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: CommonTextField(
                        title: Strings.businessEmail.tr,
                        controller:
                            businessRegisterController.businessEmailController,
                        onChange: businessRegisterController.setEmail,
                        keyboardType: TextInputType.emailAddress,
                        // validator: businessRegisterController.validateEmail(),
                      ),
                    ),
                    businessRegisterController.businessEmail.isNotEmpty
                        ? Text(businessRegisterController.businessEmail,
                            style: errorStyle)
                        : SizedBox(),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: CommonTextField(
                        title: Strings.phoneno.tr,
                        prefixText: "+91 ",
                        controller:
                            businessRegisterController.phoneNoController,
                        onChange: businessRegisterController.setPhone,
                        keyboardType: TextInputType.phone,
                        //validator: businessRegisterController.validatePhone(),
                      ),
                    ),
                    businessRegisterController.phoneNo.isNotEmpty
                        ? Text(businessRegisterController.phoneNo,
                            style: errorStyle)
                        : SizedBox(),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: CommonTextField(
                        title: Strings.password.tr,
                        controller:
                            businessRegisterController.passwordController,
                        onChange: businessRegisterController.setPassword,
                        isObSecure: true,
                        keyboardType: TextInputType.visiblePassword,
                        // validator:
                        //     businessRegisterController.validatePassword(),
                      ),
                    ),
                    businessRegisterController.password.isNotEmpty
                        ? Text(businessRegisterController.password,
                            style: errorStyle)
                        : SizedBox(),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                     SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: DropDownTextFled(
                          //controller: businessRegisterController.categoryController,
                          title: Strings.category.tr,
                        )),
                    // DropdownButtonFormField<String>(
                    //   items: [
                    //     DropdownMenuItem<String>(
                    //       value: "January",
                    //       child: Text(
                    //         "Male",
                    //       ),
                    //     ),
                    //     DropdownMenuItem<String>(
                    //       value: "February",
                    //       child: Text(
                    //         "Female",
                    //       ),
                    //     ),
                    //   ],
                    //   onChanged: (value) async {
                    //     businessRegisterController.setCategoryDrop;
                    //   },
                    //   value: businessRegisterController.categoryDrop,
                    //   validator: (value) =>
                    //       value == null ? 'Please fill in your gender' : null,
                    //   decoration: InputDecoration(
                    //     enabledBorder: UnderlineInputBorder(
                    //       borderSide: BorderSide(color: Colors.white),
                    //     ),
                    //     focusedBorder: UnderlineInputBorder(
                    //       borderSide: BorderSide(color: Colors.white),
                    //     ),
                    //   ),
                    //   elevation: 2,
                    //   style: TextStyle(color: Colors.white, fontSize: 16),
                    //   isDense: true,
                    //   iconSize: 30.0,
                    //   iconEnabledColor: Colors.white,
                    // ),

                    SizedBox(
                      height: Get.height * 0.06,
                    ),
                    CommonBtn(
                        onTap: () async {
                          FocusScope.of(context).unfocus();
                          if (businessRegisterController.validationSignup()) {
                            businessRegisterController.registerUser(
                                firstName: controller.userNameController.text,
                                businessname: controller.businessNameController.text,
                                lastName: controller.businessEmailController.text,
                                mobile: controller.passwordController.text,
                                password: controller.passwordController.text,
                                category: controller.categoryController.text);
                          }
                        },
                        title: Strings.register.tr),
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
