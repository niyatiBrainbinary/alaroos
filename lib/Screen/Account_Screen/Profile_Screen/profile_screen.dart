import 'package:alaroos/Screen/Account_Screen/Edit_Account_Screen/edit_account_screen.dart';
import 'package:alaroos/Screen/Account_Screen/Profile_Screen/profile_screen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Common/text_filed.dart';
import '../../../Common/text_style.dart';
import '../../../Utils/assets_res.dart';
import '../../../Utils/color_res.dart';
import '../../../Utils/string.dart';
import '../Edit_Account_Screen/edit_account_controller.dart';

class Profile_Screen extends StatelessWidget {
 Profile_Screen({Key? key}) : super(key: key);
  final ProfileScreenController profileScreenController = Get.put(ProfileScreenController());

  @override
  Widget build(BuildContext context) {
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
          Strings.profile,
          style: forgotPass,
        ),
        centerTitle: true,
      ),
      body: GetBuilder<ProfileScreenController>(
        id: 'profile',
        builder: (controller) {
          return  Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: SingleChildScrollView(
              child: Form(
                // key: edit_account_controller.editForm,
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
                    GestureDetector(onTap: (){




                      Get.to(()=>Edit_Account_Screen(

                      ));},


                      child: Container(
                        height: Get.height * 0.05,
                        width: Get.width*0.4,
                        decoration: ShapeDecoration(
                          color: ColorRes.btnColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          shadows: [
                            BoxShadow(
                              color: ColorRes.shadowColor.withOpacity(0.1),
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            Strings.editProfile,
                            style: btnText,
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
                        readOnly: true,
                        title: Strings.name,
                        controller:
                        profileScreenController.editNameController,
                        keyboardType: TextInputType.text,
                      ),
                    ),

                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: CommonTextField(readOnly: true,
                        title: Strings.email,
                        controller:
                        profileScreenController.editEmailController,
                        keyboardType: TextInputType.text,
                      ),
                    ),

                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: CommonTextField(readOnly: true,
                        title: Strings.businessName,
                        controller: profileScreenController
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
                      child: CommonTextField(readOnly: true,
                        title: Strings.password,
                        controller:
                        profileScreenController.editPasswordController,
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
                      child: CommonTextField(readOnly: true,
                        title: Strings.phoneno,
                        prefixText: "+91 ",
                        controller:
                        profileScreenController.editPhoneNoController,
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: CommonTextField(readOnly: true,
                        title: Strings.link,
                        controller: profileScreenController.linkController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),

                  ],
                ),
              ),
            ),
          );
        },

      ),);
  }
}
