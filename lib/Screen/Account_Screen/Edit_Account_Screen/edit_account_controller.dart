import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Edit_Account_Controller extends GetxController {
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
}
