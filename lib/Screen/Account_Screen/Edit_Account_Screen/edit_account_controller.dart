import 'package:alaroos/Utils/pref_key.dart';
import 'package:alaroos/service/pref_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

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



  Future editProfileApi({required String firstName, required String lastName, required String businessname, required String phone,required String email, required String profileImage})
  async {
    isLoading.value = true;

    editProfileModel =  await EditProfileApi.editProfileApi(email: email, firstName: firstName, lastName: lastName, phone: phone, businessname: businessname,profileimage: profileImage);
    PrefService.setValue(PrefKeys.firstName, editProfileModel.data?.firstname ?? "");
    PrefService.setValue(PrefKeys.lastName, editProfileModel.data?.lastname ?? "");
    PrefService.setValue(PrefKeys.email, editProfileModel.data?.email ?? "");
    PrefService.setValue(PrefKeys.mobileNumber, editProfileModel.data?.phone ?? "");
    PrefService.setValue(PrefKeys.userImage, editProfileModel.data?.profileimage ?? "");

    isLoading.value = false;
  }

  File? _selectedImage;



  File? image;
  final ImagePicker picker = ImagePicker();
  Future<void> getImageFromCamera() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      image = File(photo.path);
      if(image != null)
      {



      }


      //  String imageUrl = await uploadImage(image);
      //    print('Image URL: $imageUrl');
    }
    update(['profile']);
  }

}
