import 'package:flutter/material.dart';
import 'package:get/get.dart';

class New_Post_Controller extends GetxController {
  final GlobalKey<FormState> newPostForm = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  String title = "";
  String description = "";
}
