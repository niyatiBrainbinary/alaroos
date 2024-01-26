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
import '../../../Utils/pref_key.dart';
import '../../../Utils/string.dart';
import '../../../service/pref_service.dart';

class Edit_Account_Screen extends StatefulWidget {
  const Edit_Account_Screen({Key? key}) : super(key: key);

  @override
  State<Edit_Account_Screen> createState() => _Edit_Account_ScreenState();
}

class _Edit_Account_ScreenState extends State<Edit_Account_Screen> {
  Edit_Account_Controller editAccountController =
      Get.put(Edit_Account_Controller());
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  File? imgFile;

  File? _selectedImage;

  Future<void> _pickImage() async {
   // final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = pickedFile != null ? File(pickedFile.path) : null;
    });
  }

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
                    key: editAccountController.editForm,
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
                      /*  Center(
                          child: GestureDetector(
                            onTap: _pickImage,
                            child: CircleAvatar(
                              //backgroundImage: _selectedImage != null ? FileImage(_selectedImage!) : null,
                              radius: Get.height * 0.063,
                              foregroundImage: AssetImage(AssetsRes.userImage2),
                              child: _selectedImage == null
                                  ? Icon(Icons.camera_alt, size: 50.0, color: Colors.white)
                                  : null,
                            ),
                          ),
                        ),*/
                        GestureDetector(
                          onTap: _pickImage,
                          child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue,
                                image: _selectedImage == null
                                    ? PrefService.getString(PrefKeys.userImage) != ""?
                                DecorationImage(fit: BoxFit.fill,image: NetworkImage(PrefService.getString(PrefKeys.userImage))):DecorationImage(image: AssetImage(AssetsRes.userImage2))
                                    : DecorationImage(
                                    fit: BoxFit.fill,
                                    image: FileImage(
                                      File(_selectedImage!.path),
                                    )),
                              )),
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
                            // readOnly: true
                            // ,
                            title: Strings.name,
                            controller:
                                editAccountController.editNameController,
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
                                editAccountController.editEmailController,
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
                            controller: editAccountController
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
                                editAccountController.editPasswordController,
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
                                editAccountController.editPhoneNoController,
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
                            controller: editAccountController.linkController,
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),

                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        CommonBtn(
                            onTap: () async {
                              editAccountController.editProfileApi(
                                  email: editAccountController.editEmailController.text,
                                  firstName: editAccountController.editNameController.text,
                                  lastName: editAccountController.editBusinessNameController.text,
                                  phone: editAccountController.editPhoneNoController.text,
                                  businessname: editAccountController.editBusinessNameController.text,
                                  profileImage: '');
                              //profileScreenController.isEditProfile = true;
                              editAccountController.update(['edit_account']);

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
