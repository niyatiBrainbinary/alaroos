import 'package:alaroos/Screen/Category_Screen/category_screen.dart';
import 'package:alaroos/Screen/Category_select_Screen/category_controller.dart';
import 'package:alaroos/Screen/Dashboard/Widgets/bottom_bar.dart';
import 'package:alaroos/Screen/WhatsApp_Message/Message_Screen/message_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Common/common_btn.dart';
import '../../Common/text_style.dart';
import '../../Utils/assets_res.dart';
import '../../Utils/color_res.dart';
import '../../Utils/string.dart';

class Category_Select_Screen extends StatefulWidget {
  const Category_Select_Screen({Key? key}) : super(key: key);

  @override
  State<Category_Select_Screen> createState() => _Category_Select_ScreenState();
}

class _Category_Select_ScreenState extends State<Category_Select_Screen> {

  int currentindex=0;
CategoryController categoryController = Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();

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

      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(
              height: Get.height * 0.030,
            ),

            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: Get.height * 0.550,
                  width: double.infinity,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: 7,
                    onPageChanged: (value) {

                      setState(() {
                        currentindex = value;
                        print(currentindex);
                      });
                    },
                    itemBuilder: (contex, i) {
                      return  Column(
                        children: [
                          Center(
                            child: Text(
                              Strings.wedding,
                              style: homeTitle,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.030,
                          ),

                          Container(
                            height: Get.height * 0.450,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  AssetsRes.homeSelect,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                        ],
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {

                          setState(() {
                            currentindex--;
                       });
                       print("===========????  ${pageController.page}");
                          pageController.animateToPage(currentindex, duration: Duration(seconds: 1), curve: Curves.linear);
                          //pageController.jumpToPage(currentindex);
                        },
                        icon: Icon(
                          CupertinoIcons.chevron_left_circle,
                          color: ColorRes.themeColor,
                          size: Get.height * 0.040,
                        )),
                    IconButton(
                      onPressed: () {

                        setState(() {
                          currentindex++;
                        });
                        print("===========????  ${pageController.page}");
                         pageController.animateToPage(currentindex, duration: Duration(seconds: 1), curve: Curves.linear);
                        //pageController.jumpToPage(currentindex);
                      },
                      icon: Icon(
                        CupertinoIcons.chevron_right_circle,
                        color: ColorRes.themeColor,
                        size: Get.height * 0.040,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(
              height: Get.height * 0.070,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: CommonBtn(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    categoryController.onInit();
                    //Get.to(() => const BottomBar());
                    Get.to(() =>  Category_Screen(

                     //   categoryController.onInit();
                    ));
                  },
                  title: Strings.start),
            ),
          ],
        ),
      ),
    );
  }
}
