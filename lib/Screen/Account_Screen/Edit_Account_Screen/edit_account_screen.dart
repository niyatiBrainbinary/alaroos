import 'dart:io';

import 'package:alaroos/Common/common_btn.dart';
import 'package:alaroos/Screen/Account_Screen/Edit_Account_Screen/edit_account_controller.dart';
import 'package:alaroos/Screen/Account_Screen/Profile_Screen/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Common/text_filed.dart';
import '../../../Common/text_style.dart';
import '../../../Utils/assets_res.dart';
import '../../../Utils/color_res.dart';
import '../../../Utils/string.dart';

class Edit_Account_Screen extends StatefulWidget {
  const Edit_Account_Screen({Key? key}) : super(key: key);

  @override
  State<Edit_Account_Screen> createState() => _Edit_Account_ScreenState();
}

class _Edit_Account_ScreenState extends State<Edit_Account_Screen> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
    File? imgFile;
    Edit_Account_Controller edit_account_controller =
        Get.put(Edit_Account_Controller());
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(CupertinoIcons.back),
          ),
          shape: const Border(bottom: BorderSide(color: ColorRes.textColor)),
          backgroundColor: ColorRes.btnColor,
          toolbarHeight: Get.height * 0.13,
          title: Text(
            Strings.editProfile,
            style: forgotPass,
          ),
          centerTitle: true,
        ),
        body: GetBuilder<Edit_Account_Controller>(
          id: 'edit_account',
          builder: (controller) {
            return Scaffold(
              key: scaffoldkey,
              body: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: SingleChildScrollView(
                  child: Form(
                    key: edit_account_controller.editForm,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: Get.height * 0.04,
                        ),
                        // CircleAvatar(
                        //   radius: Get.height * 0.063,
                        //   foregroundImage:
                        //   (imgFile == null) ? null : FileImage(imgFile as File),
                        //   child: FloatingActionButton(
                        //     elevation: 0,
                        //     onPressed: () async {
                        //       scaffoldkey.currentState!.showBottomSheet(
                        //             (context) => Container(
                        //           height: 200,
                        //           child: Column(
                        //             children: [
                        //               ListTile(
                        //                 title: Text("Pick the Camera"),
                        //                 onTap: () async {
                        //                   ImagePicker picker = ImagePicker();
                        //                   XFile? xfile = await picker.pickImage(
                        //                       source: ImageSource.camera);
                        //                   String path = xfile!.path;
                        //                   setState(() {
                        //                     imgFile = File(path);
                        //                   });
                        //                   Navigator.of(context).pop();
                        //                 },
                        //               ),
                        //               ListTile(
                        //                 title: Text("Pick the Gallery"),
                        //                 onTap: () async {
                        //                   ImagePicker picker = ImagePicker();
                        //                   XFile? xfile = await picker.pickImage(
                        //                       source: ImageSource.gallery);
                        //                   String path = xfile!.path;
                        //                   setState(() {
                        //                     imgFile = File(path);
                        //                   });
                        //                   Navigator.of(context).pop();
                        //                 },
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       );
                        //     },
                        //     child: const Icon(
                        //       Icons.camera_alt_outlined,
                        //       size: 30,
                        //     ),
                        //   ),
                        // ),
                        Center(
                          child: CircleAvatar(
                            radius: Get.height * 0.063,
                            foregroundImage: AssetImage(AssetsRes.userImage2),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Text(
                          "Edit picture or avatar",
                          style: forgotPass,
                        ),
                        SizedBox(
                          height: Get.height * 0.04,
                        ),
                        SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: CommonTextField(
                            title: Strings.name,
                            controller:
                                edit_account_controller.editNameController,
                            keyboardType: TextInputType.text,
                          ),
                        ),

                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: CommonTextField(
                            title: Strings.email,
                            controller:
                                edit_account_controller.editEmailController,
                            keyboardType: TextInputType.text,
                          ),
                        ),

                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: CommonTextField(
                            title: Strings.businessName,
                            controller: edit_account_controller
                                .editBusinessNameController,
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: CommonTextField(
                            title: Strings.password,
                            controller:
                                edit_account_controller.editPasswordController,
                            isObSecure: true,
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        ),

                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: CommonTextField(
                            title: Strings.phoneno,
                            prefixText: "+91 ",
                            controller:
                                edit_account_controller.editPhoneNoController,
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: CommonTextField(
                            title: Strings.link,
                            controller: edit_account_controller.linkController,
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),

                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        CommonBtn(
                            onTap: () async {
                              Get.to(()=>Profile_Screen());
                              // edit_account_controller.onTapSignUp();
                            },
                            title: Strings.saveChange),
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
        ));
  }
}
