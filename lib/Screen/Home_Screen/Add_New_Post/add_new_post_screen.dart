import 'dart:io';

import 'package:alaroos/Common/common_btn.dart';
import 'package:alaroos/Common/toast.dart';
import 'package:alaroos/Screen/Home_Screen/Add_New_Post/add_new_post_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../Common/text_filed.dart';
import '../../../Common/text_style.dart';
import '../../../Utils/color_res.dart';
import '../../../Utils/string.dart';

class Add_New_Post extends StatefulWidget {
  Add_New_Post({Key? key}) : super(key: key);

  @override
  State<Add_New_Post> createState() => _Add_New_PostState();
}

class _Add_New_PostState extends State<Add_New_Post> {
  AddNewPostController addNewPostController = Get.put(AddNewPostController());
@override
  void initState() {
  addNewPostController.titleController.text = "";
  addNewPostController.descriptionController.text = "";

  addNewPostController.update();
  super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
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
          body: Stack(
            children: [
              SafeArea(
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
                              onTap: () {
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
                              child: SizedBox(
                                height: Get.height * 0.4,
                                width: double.infinity,
                                /* decoration: BoxDecoration(
                                  color: ColorRes.btnColor,
                                  // shape: BoxShape.circle,
                                  image: controller.selectedImage == null ||
                                          controller.pickedVideoFile == null
                                      ? PrefService.getString(PrefKeys.userImage) !=
                                              ""
                                          ? DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(
                                                  PrefService.getString(
                                                      PrefKeys.userImage)))
                                          : const DecorationImage(
                                              image: AssetImage(AssetsRes.designer))
                                      : DecorationImage(
                                          fit: BoxFit.fill,
                                          image: FileImage(
                                            File(controller.selectedImage!.path),
                                          )),
                                ),*/
                                child: controller.selectedImage != null
                                    ? Image.file(
                                        File(controller.selectedImage!.path),
                                        fit: BoxFit.cover,
                                      )
                                    : controller.pickedVideoFile != null
                                        ? Center(
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                AspectRatio(
                                                  aspectRatio: controller
                                                      .controller!
                                                      .value
                                                      .aspectRatio,
                                                  child: VideoPlayer(
                                                      controller.controller!),
                                                ),
                                                GestureDetector(
                                                    onTap: () {
                                                      controller.isPlaying
                                                          ? controller
                                                              .controller!
                                                              .pause()
                                                          : controller
                                                              .controller!
                                                              .play();
                                                      controller.isPlaying =
                                                          !controller.isPlaying;
                                                      controller
                                                          .update(["newPost"]);
                                                    },
                                                    child: controller
                                                                .isPlaying ==
                                                            true
                                                        ? const Icon(
                                                            Icons.pause,
                                                            size: 40,
                                                            color: Colors.white,
                                                          )
                                                        : const Icon(
                                                            Icons.play_arrow,
                                                            color: Colors.white,
                                                            size: 40,
                                                          ))
                                              ],
                                            ),
                                          )
                                        : Center(
                                            child: Text(Strings.addVideo ,
                                            style: addImage,
                                          )),
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
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: SizedBox(
                                height: 60,
                                width: double.infinity,
                                child: CommonTextField(
                                  title: Strings.titles,
                                  controller:
                                      addNewPostController.titleController,
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
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: SizedBox(
                                height: 60,
                                width: double.infinity,
                                child: CommonTextField(
                                  title: Strings.description,
                                  controller: addNewPostController
                                      .descriptionController,
                                  keyboardType: TextInputType.text,
                                ),
                              ),
                            ),
                            (controller.descriptionError != "")
                                ? Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 3),
                                      child: Text(
                                          controller.descriptionError.tr,
                                          style: errorStyle),
                                    ),
                                  )
                                : const SizedBox(),
                            SizedBox(
                              height: Get.height * 0.1,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: CommonBtn(
                                  onTap: () {
                                    if (controller.validation()) {
                                      if(controller.addVideoModel.data!=null){
                                        addNewPostController.addPostApi(
                                            title: addNewPostController
                                                .titleController.text,
                                            description: addNewPostController
                                                .descriptionController.text,
                                            image: controller.addVideoModel.data!.first.mediaUrl.toString(),
                                          type:  controller.addVideoModel.data!.first.type.toString(),
                                          id:  controller.addVideoModel.data!.first.publicId

                                        );
                                      }else{
                                        errorToast("Please Upload Video/Image");
                                      }

                                    }
                                    //profileScreenController.isEditProfile = true;
                                    addNewPostController.update(['newPost']);

                                    //Get.to(() => Home_Details_Screen());
                                  },
                                  title: Strings.share),
                            ),
                            SizedBox(
                              height: Get.height * 0.08,
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
        Obx(() => addNewPostController.isLoading.isTrue
            ? const Center(child: CircularProgressIndicator())
            : const SizedBox())
      ],
    );
  }
}
