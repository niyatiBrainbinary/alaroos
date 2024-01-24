import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Common/text_style.dart';
import '../../../../Utils/assets_res.dart';
import '../../../../Utils/color_res.dart';
import '../../../../Utils/string.dart';

class Reels_Screen extends StatelessWidget {
  const Reels_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(CupertinoIcons.back),
        ),
        shape: const Border(bottom: BorderSide(color: ColorRes.textColor)),
        backgroundColor: ColorRes.btnColor,
        toolbarHeight: Get.height * 0.13,
        title: Column(
          children: [
            Text(
              Strings.username,
              style: forgotPass,
            ),
            Text(
              Strings.video,
              style: donthaveac,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.026,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: Get.height * 0.033,
                    foregroundImage: AssetImage(AssetsRes.userImage),
                  ),
                  SizedBox(
                    width: Get.width * 0.020,
                  ),
                  Text(
                    Strings.username,
                    style: forgotPass,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.022,
            ),
            Container(
              height: Get.height * 0.350,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AssetsRes.image1), fit: BoxFit.cover),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Icon(
                    CupertinoIcons.play,
                    color: ColorRes.themeColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.012,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.title,
                    style: register,
                  ),
                  Container(
                    height: Get.height * 0.05,
                    width: Get.width * 0.45,
                    decoration: const BoxDecoration(),
                    child: Text(
                      Strings.subtitle,
                      textAlign: TextAlign.center,
                      style: subTitleStyle,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.026,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: Get.height * 0.033,
                    foregroundImage: AssetImage(AssetsRes.userImage),
                  ),
                  SizedBox(
                    width: Get.width * 0.020,
                  ),
                  Text(
                    Strings.username,
                    style: forgotPass,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.022,
            ),
            Container(
              height: Get.height * 0.350,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AssetsRes.image1), fit: BoxFit.cover),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Icon(
                    CupertinoIcons.play,
                    color: ColorRes.themeColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.012,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.title,
                    style: register,
                  ),
                  Container(
                    height: Get.height * 0.05,
                    width: Get.width * 0.45,
                    decoration: const BoxDecoration(),
                    child: Text(
                      Strings.subtitle,
                      textAlign: TextAlign.center,
                      style: subTitleStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
