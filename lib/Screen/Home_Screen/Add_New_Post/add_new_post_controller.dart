import 'package:alaroos/Api_calling/screen/add_post/add_post_api.dart';
import 'package:alaroos/Api_calling/screen/add_post/add_post_model.dart';
import 'package:alaroos/Api_calling/screen/add_video/add_video_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../../../Api_calling/screen/add_video/add_video_api.dart';
import '../../../Utils/string.dart';
import '../../Account_Screen/account_screen.dart';

class AddNewPostController extends GetxController {
  final GlobalKey<FormState> newPostForm = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  String title = "";
  String description = "";
  String imageError = "";
  String titleError = "";
  String descriptionError = "";

/*
  imageValidation() {
    if (selectedImage == null) {
      imageError = Strings.addImage;
    } else {
      imageError = "";
    }
    update(['newPost']);
  }
*/

  titleValidation() {
    if (titleController.text.trim() == "") {
      titleError = Strings.titleError;
    } else {
      titleError = '';
    }
    update(['newRepair']);
  }

  descriptionValidation() {
    if (descriptionController.text.trim() == "") {
      descriptionError = Strings.descriptionError;
    } else {
      descriptionError = '';
    }
    update(['newRepair']);
  }

  val() async {
    // imageValidation();
    titleValidation();
    descriptionValidation();
  }

  validation() {
    val();
    if (imageError == "" && titleError == "" && descriptionError == "") {
      return true;
    } else {
      return false;
    }
  }

  void settingModalBottomSheet(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.music_note),
                    title: new Text('photo'),
                    onTap:
                      pickImage

                ),
                new ListTile(
                  leading: new Icon(Icons.videocam),
                  title: new Text('Video'),
                  onTap: pickVideo,
                ),
              ],
            ),
          );
        });
  }

  File? selectedImage;

  Future<void> pickImage() async {
    // final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if(pickedFile != null) {
      await addVideoApi(file: File(pickedFile.path));
      selectedImage =  File(pickedFile.path);
    }

    update(['newPost']);
  }


  VideoPlayerController? controller;
   Future<void>? _initializeVideoPlayerFuture;
   File? pickedVideoFile;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Future<void> pickVideo() async {
   //  pickedVideo = await ImagePicker().getVideo(source: ImageSource.gallery);
var pickedVideo = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (pickedVideo != null) {

     await addVideoApi(file: File(pickedVideo.path));
     if(addVideoModel.data != null){
       //Get.to(() => Account_Screen());

        pickedVideoFile = File(pickedVideo.path);
        controller = VideoPlayerController.file(pickedVideoFile!)
          ..initialize().then((_) {
            controller?.setLooping(true);
            controller?.play();
          });}
update(['newPost']);
    }
  }

  RxBool isLoading = false.obs;
  AddPostModel addPostModel = AddPostModel();

  Future addPostApi({required String title, required String description, required String image}) async {
    isLoading.value = true;
    addPostModel = await AddPostApi.addPostApi(title: title, description: description, image_url: image);
   if(addPostModel.data != null){
    Get.to(() => Account_Screen());
   }
    isLoading.value = false;
  }

AddVideoModel addVideoModel = AddVideoModel();
  Future addVideoApi({required File file}) async {
    isLoading.value = true;
    addVideoModel = await AddVideoApi.addVideoApi(file: file);
    isLoading.value = false;
  }


  @override
  void onInit() {
    controller = VideoPlayerController.network('');
    _initializeVideoPlayerFuture = controller?.initialize();
    controller?.setLooping(true);
    // TODO: implement onInit
    super.onInit();


  }
}
