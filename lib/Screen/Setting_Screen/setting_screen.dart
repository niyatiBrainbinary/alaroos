import 'package:alaroos/Screen/Account_Screen/account_screen.dart';
import 'package:alaroos/Screen/Select_Language/select_language.dart';
import 'package:alaroos/Screen/Setting_Screen/setting_controller.dart';
import 'package:alaroos/Screen/Setting_Screen/widget/setting_btn_list.dart';
import 'package:alaroos/Screen/Splash/splash_screen.dart';
import 'package:alaroos/service/pref_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Common/text_style.dart';
import '../../Utils/color_res.dart';
import '../../Utils/string.dart';

class Setting_Screen extends StatelessWidget {
   Setting_Screen({Key? key}) : super(key: key);
SettingController settingController = Get.put(SettingController());
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
          Strings.setting,
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
              title: Strings.account,
              onTap: () {
                Get.to(() => Account_Screen());
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
              title: Strings.language,
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
              title: Strings.privateAccount,
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
              title: Strings.settingNotification,
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
              title: Strings.logout,
              onTap: () {
                settingController.logout();
               // PrefService.clear();

              },
              icon: Icons.logout,
            ),
          ),
        ],
      ),
    );
  }
}
