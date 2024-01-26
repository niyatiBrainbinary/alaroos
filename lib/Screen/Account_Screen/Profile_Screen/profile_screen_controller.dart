import 'package:alaroos/Api_calling/screen/edit_profile/edit_profile_api.dart';
import 'package:alaroos/Api_calling/screen/edit_profile/edit_profile_model.dart';
import 'package:alaroos/Utils/pref_key.dart';
import 'package:alaroos/service/pref_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreenController extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    editNameController.text = PrefService.getString(PrefKeys.firstName);
    editBusinessNameController.text = PrefService.getString(PrefKeys.lastName);
    editEmailController.text = PrefService.getString(PrefKeys.email);
    editPhoneNoController.text = PrefService.getString(PrefKeys.mobileNumber);
    super.onInit();

  }
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




}
