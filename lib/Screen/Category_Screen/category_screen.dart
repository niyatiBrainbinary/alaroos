import 'package:alaroos/Api_calling/auth/all_category/all_category_model.dart';
import 'package:alaroos/Screen/Dashboard/Widgets/bottom_bar.dart';
import 'package:alaroos/Screen/Dashboard/Widgets/bottom_controller.dart';
import 'package:alaroos/Screen/WhatsApp_Message/business/Message_Screen/message_controller.dart';
import 'package:alaroos/Screen/WhatsApp_Message/business/Message_Screen/message_screen.dart';
import 'package:alaroos/Screen/WhatsApp_Message/user/Message_Screen_User/message_controller_user.dart';
import 'package:alaroos/Screen/WhatsApp_Message/user/Message_Screen_User/message_screen_user.dart';
import 'package:alaroos/Utils/pref_key.dart';
import 'package:alaroos/service/pref_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Common/common_btn.dart';
import '../../Common/text_style.dart';
import '../../Utils/color_res.dart';
import '../../Utils/string.dart';
import '../Category_select_Screen/category_controller.dart';

class Category_Screen extends StatelessWidget {
   Category_Screen({Key? key}) : super(key: key);

  CategoryController categoryController = Get.put(CategoryController());

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
            onPressed: () async {
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
            icon: const Icon(
              CupertinoIcons.chat_bubble_text,
              color: ColorRes.textColor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: SingleChildScrollView(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categoryController.allCategoryModel.data?.length,
            itemBuilder: (context, index) {
            return     Column(
              children: [
                const SizedBox(height: 20,),
                CommonBtn(
                    onTap: () {
                      BottomBarController bom = Get.put(BottomBarController());
                      bom.currentPage.value = 0;
                      Get.to(() =>  BottomBar());
                    },
                    title: categoryController.allCategoryModel.data?[index].title ?? ""),
                const SizedBox(height: 20,),

              ],
            );
          },),
        ),
      ),
    );
  }
}
