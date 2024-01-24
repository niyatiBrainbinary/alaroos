import 'package:alaroos/Common/common_btn.dart';
import 'package:alaroos/Common/text_style.dart';
import 'package:alaroos/Screen/Account_Screen/account_screen.dart';
import 'package:alaroos/Screen/Home_Screen/Home_details/home_details.dart';
import 'package:alaroos/Utils/assets_res.dart';
import 'package:alaroos/Utils/color_res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/string.dart';

class Container_Screen extends StatelessWidget {
  const Container_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.height * 0.300,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(AssetsRes.banner), fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: Get.height * 0.046,
            ),
            GestureDetector(
              onTap: () {
                Get.to(
                  () => const Home_Details_Screen(),
                );
              },
              child: Padding(
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
            ),
            SizedBox(
              height: Get.height * 0.022,
            ),
            Container(
              height: Get.height * 0.350,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(AssetsRes.image1), fit: BoxFit.cover),
              ),
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
              height: Get.height * 0.046,
            ),
            GestureDetector(
              onTap: () => Get.to(() => Account_Screen()),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: Get.height * 0.033,
                      foregroundImage: const AssetImage(AssetsRes.userImage2),
                    ),
                    SizedBox(
                      width: Get.width * 0.020,
                    ),
                    Text(
                      Strings.username2,
                      style: forgotPass,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.022,
            ),
            Container(
              height: Get.height * 0.350,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(AssetsRes.image2), fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.title2,
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
              height: Get.height * 0.1,
            ),
          ],
        ),
      ),
    );
  }
}
