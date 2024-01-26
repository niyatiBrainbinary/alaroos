import 'package:alaroos/Common/common_btn.dart';
import 'package:alaroos/Screen/Home_Screen/Add_New_Post/add_new_post_controller.dart';
import 'package:alaroos/Screen/Home_Screen/Home_details/home_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';
import '../../../Common/text_filed.dart';
import '../../../Common/text_style.dart';
import '../../../Utils/assets_res.dart';
import '../../../Utils/color_res.dart';
import '../../../Utils/pref_key.dart';
import '../../../Utils/string.dart';
import '../../../service/pref_service.dart';

class Add_New_Post extends StatefulWidget {
  Add_New_Post({Key? key}) : super(key: key);

  @override
  State<Add_New_Post> createState() => _Add_New_PostState();
}

class _Add_New_PostState extends State<Add_New_Post> {
  AddNewPostController addNewPostController = Get.put(AddNewPostController());

  /* File? _selectedImage;

  Future<void> _pickImage() async {
    // final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    _selectedImage = pickedFile != null ? File(pickedFile.path) : null;
    addNewPostController.update(['newPost']);
  }*/

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
        centerTitle: true,
        backgroundColor: ColorRes.btnColor,
        toolbarHeight: Get.height * 0.13,
        title: Text(
          Strings.newPost,
          style: forgotPass,
        ),
      ),
      body: SafeArea(
        child: GetBuilder<AddNewPostController>(
            id: 'newPost',
            builder: (controller) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.06,
                    ),
                    /*     GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                            image: _selectedImage == null
                                ? PrefService.getString(PrefKeys.userImage) != ""?
                            DecorationImage(fit: BoxFit.fill,image: NetworkImage(PrefService.getString(PrefKeys.userImage))):DecorationImage(image: AssetImage(AssetsRes.videoImage))
                                : DecorationImage(
                                fit: BoxFit.fill,
                                image: FileImage(
                                  File(_selectedImage!.path),
                                )),
                          )),
                    ),*/
                    GestureDetector(
                      onTap: (){
                        controller.settingModalBottomSheet(context);
                        /*showBottomSheet(
                          builder: (context) {
                          return Container(
                            height:50 ,
                            width: Get.width,
                            color: Colors.red,
                            child: Row(
                              children: [
                                GestureDetector(
                                   // onTap: controller.pickImage,
                                    child: Icon(Icons.video_camera_back_rounded)),
                                GestureDetector(
                                   // onTap: controller.pickVideo,
                                    child: Icon(Icons.photo))
                              ],
                            ),
                          );
        
                        }, context: context,
                      );*/
                      },
                    //  onTap: controller.pickImage,
                      child: Container(
                        height: Get.height * 0.4,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: ColorRes.btnColor,
                          // shape: BoxShape.circle,
                          image: controller.selectedImage == null || controller.pickedVideoFile == null
                              ? PrefService.getString(PrefKeys.userImage) != ""
                                  ? DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(PrefService.getString(
                                          PrefKeys.userImage)))
                                  : DecorationImage(
                                      image: AssetImage(AssetsRes.designer))
                              : DecorationImage(
                                  fit: BoxFit.fill,
                                  image: FileImage(
                                    File(controller.selectedImage!.path),
                                  )),
                        ),
                      ),
                    ),
                    (controller.imageError != "")
                        ? Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Text(controller.imageError.tr,
                                  style: errorStyle),
                            ),
                          )
                        : const SizedBox(),
                    SizedBox(
                      height: Get.height * 0.06,
                    ),
                   /* Column(
                      children: <Widget>[
                        controller.pickedVideo == null
                            ? AspectRatio(
                                aspectRatio:
                                    controller.controller!.value.aspectRatio,
                                child: VideoPlayer(controller.controller!),
                              )
                            : Container(),
                        ElevatedButton(
                          onPressed: controller.pickVideo,
                          child: Text('Pick Video'),
                        ),
                      ],
                    ),*/
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: CommonTextField(
                          title: Strings.titles,
                          controller: addNewPostController.titleController,
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ),
                    (controller.titleError != "")
                        ? Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Text(controller.titleError.tr,
                                  style: errorStyle),
                            ),
                          )
                        : const SizedBox(),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: CommonTextField(
                          title: Strings.description,
                          controller: addNewPostController.descriptionController,
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ),
                    (controller.descriptionError != "")
                        ? Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Text(controller.descriptionError.tr,
                                  style: errorStyle),
                            ),
                          )
                        : const SizedBox(),
                    SizedBox(
                      height: Get.height * 0.1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: CommonBtn(
                          onTap: () {
                            if (controller.validation()) {
        
                              addNewPostController.addPostApi(
                                  title:
                                      addNewPostController.titleController.text,
                                  description: addNewPostController
                                      .descriptionController.text,
                                  image: addNewPostController.selectedImage
                                      .toString());
                            }
                            //profileScreenController.isEditProfile = true;
                            addNewPostController.update(['newPost']);
        
                            //Get.to(() => Home_Details_Screen());
                          },
                          title: Strings.share),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
