import 'dart:io';

import 'package:alaroos/Api_calling/screen/add_post/add_post_api.dart';
import 'package:alaroos/Api_calling/screen/add_post/add_post_model.dart';
import 'package:alaroos/Api_calling/screen/add_video/add_video_model.dart';
import 'package:alaroos/Api_calling/screen/get_all_post/get_all_post_api.dart';
import 'package:alaroos/Api_calling/screen/get_all_post/get_all_post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        builder: (BuildContext bc) {
          return Wrap(
            children: <Widget>[
              ListTile(
                  leading: const Icon(Icons.music_note),
                  title: const Text('photo'),
                  onTap: pickImage),
              ListTile(
                leading: const Icon(Icons.videocam),
                title: const Text('Video'),
                onTap: pickVideo,
              ),
            ],
          );
        });
  }

  File? selectedImage;

  Future<void> pickImage() async {
    // final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      await addVideoApi(file: File(pickedFile.path), type: "image");
      selectedImage = File(pickedFile.path);
      update(['newPost']);
    }

    update(['newPost']);
  }

  VideoPlayerController? controller;
  bool isPlaying = false;

  Future<void>? _initializeVideoPlayerFuture;
  File? pickedVideoFile;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Future<void> pickVideo() async {
    //  pickedVideo = await ImagePicker().getVideo(source: ImageSource.gallery);
    var pickedVideo =
        await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (pickedVideo != null) {
      await addVideoApi(file: File(pickedVideo.path), type: "video");
      if (addVideoModel.data != null) {
        //Get.to(() => Account_Screen());

        pickedVideoFile = File(pickedVideo.path);
        controller = VideoPlayerController.networkUrl(
            Uri.parse(addVideoModel.data!.first.mediaUrl.toString()))
          ..initialize().then(
            (value) {
              controller?.setLooping(true);
              update(['newPost']);
            },
          );
        /*    controller = VideoPlayerController.file(pickedVideoFile!)
          ..initialize().then((_) {
            controller?.setLooping(true);
          */ /*  controller?.play();*/ /*
            update(['newPost']);
          });*/
      }
      update(['newPost']);
    }
  }

  RxBool isLoading = false.obs;
  AddPostModel addPostModel = AddPostModel();

  Future addPostApi(
      {required String title,
      required String description,
      required String image,
      String? type,
      String? id}) async {
    isLoading.value = true;
    addPostModel = await AddPostApi.addPostApi(
        title: title, description: description, url: image, id: id, type: type);
    if (addPostModel.data != null) {
      await callApiGetAllPost();
      Get.to(() => const Account_Screen());
    }
    isLoading.value = false;
  }

  AddVideoModel addVideoModel = AddVideoModel();

  Future addVideoApi({required File file, String? type}) async {
    try {
      isLoading.value = true;

      addVideoModel = await AddVideoApi.addVideoApi(file: file, type: type);
      if (addVideoModel.data != null) {
        Get.back();
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;

      debugPrint(e.toString());
    }
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

  GetAllPostModel getAllPostModel = GetAllPostModel();
  List<Map<String,dynamic>> images = [];
  List<Map<String,dynamic>> videos = [];
  List<VideoPlayerController> videoController = [];
   int? currentIndex;
  Future<void> callApiGetAllPost() async {
    try {
      isLoading.value = true;
      getAllPostModel = GetAllPostModel();
      images = [];
      videos = [];
      getAllPostModel = await GetAllPostApi.getAllPostApi();
      if (getAllPostModel.data != null) {
        for (int i = 0; i < getAllPostModel.data!.length; i++) {
          if (getAllPostModel.data![i].images!.resourceType=="image") {
            images.add({"url":getAllPostModel.data![i].images!.url,"des":getAllPostModel.data![i].description,
            "title":getAllPostModel.data![i].title});

          }
          if (getAllPostModel.data![i].images!.resourceType=="video"){
            currentIndex = 0;
            videos.add({"url":getAllPostModel.data![i].images!.url,"des":getAllPostModel.data![i].description,
              "title":getAllPostModel.data![i].title});
            videoController.add( VideoPlayerController.network(getAllPostModel.data![i].images!.url.toString()));
            initializeControllers();
          }
        }
        debugPrint("${getAllPostModel.data!.first.images}");
      }
      isLoading.value = false;
      update(["post"]);
    } catch (e) {
      isLoading.value = false;
      update(["post"]);

      debugPrint(e.toString());
    }
    isLoading.value = false;
    update(["post"]);
  }

  void initializeControllers() async {
    await Future.wait(videoController.map((controller) => controller.initialize()));
    update(["post"]);  }
}
