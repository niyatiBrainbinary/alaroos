import 'package:alaroos/Screen/Account_Screen/Edit_Account_Screen/edit_account_screen.dart';
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
  const Profile_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          Strings.profile,
          style: forgotPass,
        ),
        centerTitle: true,
      ),
      body: Padding(
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
              GestureDetector(onTap: (){Get.to(()=>Edit_Account_Screen());},
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

            ],
          ),
        ),
      ),
    ),);
  }
}
