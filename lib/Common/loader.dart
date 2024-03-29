import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: const Center(
        child:
        CircularProgressIndicator(),
      ),
    );
  }
}