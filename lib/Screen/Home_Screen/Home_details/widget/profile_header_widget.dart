import 'package:alaroos/Screen/WhatsApp_Message/Chat_Screen/chat_screen.dart';
import 'package:alaroos/Screen/WhatsApp_Message/Message_Screen/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Common/text_style.dart';
import '../../../../Utils/assets_res.dart';
import '../../../../Utils/color_res.dart';
import '../../../../Utils/string.dart';

Widget profileHeaderWidget(BuildContext contex) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: Row(
          children: [
            CircleAvatar(
              radius: Get.height * 0.060,
              foregroundImage: const AssetImage(AssetsRes.userImage),
            ),
            SizedBox(
              width: Get.width * 0.05,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Strings.username.tr,
                  style: forgotPass,
                ),
                Text(
                  Strings.trueline.tr,
                  style: btnText,
                ),
                Text(
                  Strings.riyadh.tr,
                  style: btnText,
                ),
                Text(
                  Strings.contactNo.tr,
                  style: btnText,
                ),
              ],
            ),
            SizedBox(
              width: Get.width * 0.026,
            ),
          ],
        ),
      ),
      SizedBox(
        height: Get.height * 0.02,
      ),
      Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => Message_Screen());
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: Get.height * 0.051,
                width: Get.width * 0.41,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: ColorRes.truelineContainerColor,
                ),
                child: Center(
                  child: Text(
                    Strings.whatsApp.tr,
                    style: btnText,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => Chat_Screen());
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                height: Get.height * 0.051,
                width: Get.width * 0.41,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: ColorRes.truelineContainerColor,
                ),
                child: Center(
                  child: Text(
                    Strings.message.tr,
                    style: btnText,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      SizedBox(
        height: Get.height * 0.03,
      ),
    ],
  );
}
