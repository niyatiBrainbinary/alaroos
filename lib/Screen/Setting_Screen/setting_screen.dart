import 'package:alaroos/Screen/Account_Screen/account_screen.dart';
import 'package:alaroos/Screen/Select_Language/select_language.dart';
import 'package:alaroos/Screen/Setting_Screen/widget/setting_btn_list.dart';
import 'package:alaroos/Screen/Splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Common/text_style.dart';
import '../../Utils/color_res.dart';
import '../../Utils/string.dart';

class Setting_Screen extends StatelessWidget {
  const Setting_Screen({Key? key}) : super(key: key);

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
        centerTitle: true,
        backgroundColor: ColorRes.btnColor,
        toolbarHeight: Get.height * 0.13,
        title: Text(
          Strings.setting.tr,
          style: forgotPass,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: Get.height * 0.06,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Setting_Btn_List(
              title: Strings.account.tr,
              onTap: () {
                Get.to(() => const Account_Screen());
              },
              icon: CupertinoIcons.right_chevron,
            ),
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Setting_Btn_List(
              title: Strings.language.tr,
              onTap: () {
                Get.to(() => Select_Language());
              },
              icon: CupertinoIcons.right_chevron,
            ),
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Setting_Btn_List(
              title: Strings.privateAccount.tr,
              onTap: () {},
              icon: CupertinoIcons.right_chevron,
            ),
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Setting_Btn_List(
              title: Strings.settingNotification.tr,
              onTap: () {},
              icon: CupertinoIcons.right_chevron,
            ),
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Setting_Btn_List(
              title: Strings.logout.tr,
              onTap: () {
                Get.to(() => Splash_Screen());
              },
              icon: Icons.logout,
            ),
          ),
        ],
      ),
    );
  }
}
