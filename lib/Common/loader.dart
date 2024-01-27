import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils/color_res.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color:  ColorRes.shareProfileChatColor,
      ),
    );
  }
}

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Center(
        child: Platform.isIOS
            ? const CupertinoActivityIndicator(color: ColorRes.shareProfileChatColor)
            : const CircularProgressIndicator(color: ColorRes.shareProfileChatColor),
      ),
    );
  }
}