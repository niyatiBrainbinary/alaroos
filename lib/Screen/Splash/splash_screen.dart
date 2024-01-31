import 'package:alaroos/Common/text_style.dart';
import 'package:alaroos/Screen/Auth/Guest_Auth/Guest_login/gusest_login.dart';
import 'package:alaroos/Utils/string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Common/common_btn.dart';
import '../../Utils/color_res.dart';
import '../Auth/Business_Auth/Business_login/login_screen.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: Get.height * 0.32,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: ColorRes.shadowColor.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              color: ColorRes.btnColor,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    Strings.alaroos,
                    style: splashTitle,
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Text(
                    Strings.signin,
                    style: splashSubTitle,
                  ), SizedBox(
                    height: Get.height * 0.04,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: CommonBtn(
              onTap: () {
                Get.to(() =>  Business_Login_Screen());
              },
              title: Strings.bussinessEntry,
            ),
          ),
          SizedBox(
            height: Get.height * 0.07,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: CommonBtn(
              title: Strings.loginAsGuest,
              onTap: () {
                Get.to(() => const GuestLoginScreen());
              },
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
