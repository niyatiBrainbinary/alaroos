import 'dart:io';

import 'package:alaroos/Api_calling/screen/add_video/add_video_api.dart';
import 'package:alaroos/Api_calling/screen/add_video/add_video_model.dart';
import 'package:alaroos/Utils/pref_key.dart';
import 'package:alaroos/service/pref_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Api_calling/screen/edit_profile/edit_profile_api.dart';
import '../../../Api_calling/screen/edit_profile/edit_profile_model.dart';

class Edit_Account_Controller extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    editNameController.text = PrefService.getString(PrefKeys.firstName);
    editBusinessNameController.text = PrefService.getString(PrefKeys.lastName);
    editEmailController.text = PrefService.getString(PrefKeys.email);
    editPhoneNoController.text = PrefService.getString(PrefKeys.mobileNumber);
    super.onInit();
  }

  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> editForm = GlobalKey<FormState>();
  TextEditingController editNameController = TextEditingController();
  TextEditingController editBusinessNameController = TextEditingController();
  TextEditingController editEmailController = TextEditingController();
  TextEditingController editPhoneNoController = TextEditingController();
  TextEditingController editPasswordController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController addVideoController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  String editName = "";
  String editBusinessName = "";
  String editEmail = "";
  String editPhone = "";
  String editPass = "";
  String link = "";
  String language = "";
  String addVideo = "";
  String description = "";

  RxBool isLoading = false.obs;

  EditProfileModel editProfileModel = EditProfileModel();


  Future editProfileApi({required String firstName, required String lastName, required String businessName, required String phone,required String email, required String profileImage}) async {
    isLoading.value = true;

    editProfileModel = await EditProfileApi.editProfileApi(
        email: email,
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        businessName: businessName,
        profileImage: profileImage);
    editNameController.text = editProfileModel.data?.firstname??"";
    editBusinessNameController.text = editProfileModel.data?.lastname??"";
    editEmailController.text = editProfileModel.data?.email??"";
    editPhoneNoController.text = editProfileModel.data?.phone??"";
    PrefService.setValue(
        PrefKeys.firstName, editProfileModel.data?.firstname ?? "");
    PrefService.setValue(
        PrefKeys.lastName, editProfileModel.data?.lastname ?? "");
    PrefService.setValue(PrefKeys.email, editProfileModel.data?.email ?? "");
    PrefService.setValue(
        PrefKeys.mobileNumber, editProfileModel.data?.phone ?? "");
    PrefService.setValue(
        PrefKeys.userImage, editProfileModel.data?.profileimage ?? "");

    isLoading.value = false;
  }
  File? selectedImage;
  Future<void> pickImage() async {
    isLoading.value = true;

    // final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    final pickedFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);

    selectedImage = pickedFile != null ? File(pickedFile.path) : null;
    if (selectedImage != null) {
      await addVideoApi(
          file: File(selectedImage!.path), type: "image");
      isLoading.value = false;

    }
    isLoading.value = false;

    update(['edit_account']);
  }
  AddVideoModel addVideoModel = AddVideoModel();

  Future addVideoApi({required File file, String? type}) async {
    try {
      isLoading.value = true;

      addVideoModel = await AddVideoApi.addVideoApi(file: file, type: type);
      if (addVideoModel.data != null) {
        PrefService.setValue(
            PrefKeys.userImage, addVideoModel.data?.first.mediaUrl ?? "");
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;

      debugPrint(e.toString());
    }
    isLoading.value = false;
  }
}
