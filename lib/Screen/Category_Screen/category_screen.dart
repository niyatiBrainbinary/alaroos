import 'package:alaroos/Api_calling/auth/all_category/all_category_model.dart';
import 'package:alaroos/Screen/Dashboard/Widgets/bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Common/common_btn.dart';
import '../../Common/text_style.dart';
import '../../Utils/color_res.dart';
import '../../Utils/string.dart';
import '../Category_select_Screen/category_controller.dart';
import '../WhatsApp_Message/Message_Screen/message_screen.dart';

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
        child: Expanded(
          child: ListView.builder(
            itemCount: categoryController.allCategoryModel.data?.length,
            itemBuilder: (context, index) {
            return     Column(
              children: [
                SizedBox(height: 20,),
                CommonBtn(
                    onTap: () {
                      //Get.to(() => const BottomBar());
                      Get.to(() =>  BottomBar());
                    },
                    title: categoryController.allCategoryModel.data![index].title ?? ""),
                SizedBox(height: 20,),

              ],
            );
          },),
        ),
      ),
    );
  }
}
