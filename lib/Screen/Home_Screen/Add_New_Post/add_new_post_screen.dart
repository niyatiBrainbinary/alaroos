import 'package:alaroos/Common/common_btn.dart';
import 'package:alaroos/Screen/Home_Screen/Add_New_Post/new_post_controller.dart';
import 'package:alaroos/Screen/Home_Screen/Home_details/home_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Common/text_filed.dart';
import '../../../Common/text_style.dart';
import '../../../Utils/color_res.dart';
import '../../../Utils/string.dart';

class Add_New_Post extends StatelessWidget {
  const Add_New_Post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    New_Post_Controller new_post_controller =
    Get.put(New_Post_Controller());
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
          Strings.newPost.tr,
          style: forgotPass,
        ),
      ),
      body: GetBuilder<New_Post_Controller>(
        builder: (controller){return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.06,
              ),
              Container(
                height: Get.height * 0.4,
                width: double.infinity,
                color: ColorRes.btnColor,
                child: Center(
                    child: Text(
                      Strings.addVideo.tr,
                      style: newPostTitle,
                    )),
              ),
              SizedBox(
                height: Get.height * 0.06,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30),
                child: SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: CommonTextField(
                    title: Strings.titles.tr,
                    controller:
                    new_post_controller.titleController,
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30),
                child: SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: CommonTextField(
                    title: Strings.description.tr,
                    controller:
                    new_post_controller.descriptionController,
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30),
                child: CommonBtn(onTap: (){Get.to(()=>Home_Details_Screen());}, title: Strings.share.tr),
              ),
            ],
          ),
        );}
      ),
    );
  }
}
