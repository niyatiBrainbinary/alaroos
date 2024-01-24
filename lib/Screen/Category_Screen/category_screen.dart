import 'package:alaroos/Screen/Dashboard/Widgets/bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Common/common_btn.dart';
import '../../Common/text_style.dart';
import '../../Utils/color_res.dart';
import '../../Utils/string.dart';
import '../WhatsApp_Message/Message_Screen/message_screen.dart';

class Category_Screen extends StatelessWidget {
  const Category_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const Border(bottom: BorderSide(color: ColorRes.textColor)),
        backgroundColor: ColorRes.btnColor,
        automaticallyImplyLeading: false,
        toolbarHeight: Get.height * 0.13,
        title: Text(
          Strings.alaroos,
          style: appBarTitle,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => Message_Screen());
            },
            icon: const Icon(
              CupertinoIcons.chat_bubble_text,
              color: ColorRes.textColor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            CommonBtn(
                onTap: () {
                  //Get.to(() => const BottomBar());
                  Get.to(() =>  BottomBar());
                },
                title: Strings.event),
            SizedBox(height: Get.height*0.03,),
            CommonBtn(
                onTap: () {
                  //Get.to(() => const BottomBar());
                  Get.to(() =>  BottomBar());
                },
                title: Strings.photoStudio),SizedBox(height: Get.height*0.03,),
            CommonBtn(
                onTap: () {
                  //Get.to(() => const BottomBar());
                  Get.to(() =>  BottomBar());
                },
                title: Strings.wedding),SizedBox(height: Get.height*0.03,),
            CommonBtn(
                onTap: () {
                  //Get.to(() => const BottomBar());
                  Get.to(() =>  BottomBar());
                },
                title: Strings.flowerist),SizedBox(height: Get.height*0.03,),
            CommonBtn(
                onTap: () {
                  //Get.to(() => const BottomBar());
                  Get.to(() =>  BottomBar());
                },
                title: Strings.chocoliast),SizedBox(height: Get.height*0.03,),
            CommonBtn(
                onTap: () {
                  //Get.to(() => const BottomBar());
                  Get.to(() =>  BottomBar());
                },
                title: Strings.bride),SizedBox(height: Get.height*0.03,),
            CommonBtn(
                onTap: () {
                  //Get.to(() => const BottomBar());
                  Get.to(() =>  BottomBar());
                },
                title: Strings.decoration),
          ],
        ),
      ),
    );
  }
}
