import 'package:alaroos/Screen/Account_Screen/Edit_Account_Screen/edit_account_screen.dart';
import 'package:alaroos/Screen/Account_Screen/Profile_Screen/profile_screen.dart';
import 'package:alaroos/Screen/WhatsApp_Message/business/Message_Screen/message_controller.dart';
import 'package:alaroos/Screen/WhatsApp_Message/business/Message_Screen/message_screen.dart';
import 'package:alaroos/Screen/WhatsApp_Message/user/Message_Screen_User/message_controller_user.dart';
import 'package:alaroos/Screen/WhatsApp_Message/user/Message_Screen_User/message_screen_user.dart';
import 'package:alaroos/Utils/pref_key.dart';
import 'package:alaroos/service/pref_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Common/text_style.dart';
import '../../../../../Utils/assets_res.dart';
import '../../../../../Utils/color_res.dart';
import '../../../../../Utils/string.dart';

Widget profile(BuildContext contex) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: GestureDetector(onTap: (){Get.to(()=>Profile_Screen());},
          child: Row(
            children: [
              CircleAvatar(
                radius: Get.height * 0.060,
                foregroundImage: const AssetImage(AssetsRes.userImage2),
              ),
              SizedBox(
                width: Get.width * 0.05,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.username2,
                    style: forgotPass,
                  ),
                  Text(
                    Strings.artline,
                    style: btnText,
                  ),
                  Text(
                    Strings.riyadh,
                    style: btnText,
                  ),
                  Text(
                    Strings.contactNo,
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
      ),
      SizedBox(
        height: Get.height * 0.02,
      ),
      Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() =>  Profile_Screen());
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
                    Strings.editProfile,
                    style: btnText,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              if(    PrefService.getString(PrefKeys.type) =="business"){
                MessageController messsageController = Get.put(MessageController());
                await messsageController.init();
                Get.to(() => Message_Screen());

              }
              else
              {
                MessageUserController messageUserController = Get.put(MessageUserController());
                await messageUserController.init();
                Get.to(() => Message_ScreenUser());

              }
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
                    Strings.shareProfile,
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
