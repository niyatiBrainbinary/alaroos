
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils/color_res.dart';
import '../Utils/string.dart';

void errorToast(String error, {String? title}) {
  Get.snackbar(
    title ?? Strings.eror,
    error,
    duration: const Duration(seconds: 1),
    colorText: Colors.white,
    backgroundColor: Colors.red,
  );
}

void showToast(String value, {String? title}) {
  Get.snackbar(
    title ?? Strings.success,
    value,
    duration: const Duration(seconds: 1),
    colorText: Colors.white,
    backgroundColor: Colors.green,
  );
}
