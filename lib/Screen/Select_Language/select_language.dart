import 'package:alaroos/Common/common_btn.dart';
import 'package:alaroos/Screen/Category_select_Screen/category_screen.dart';
import 'package:alaroos/Screen/Select_Language/widget/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Common/text_style.dart';
import '../../Utils/string.dart';

class Select_Language extends StatelessWidget {
  Select_Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.forgot.tr,
          style: forgotPass,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(CupertinoIcons.back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.04,
            ),
            Container(
              height: Get.height * 0.07,
              width: Get.width * 0.65,
              decoration: const BoxDecoration(),
              child: Text(
                Strings.languageDetail.tr,
                textAlign: TextAlign.center,
                style: forgotDetails,
              ),
            ),
            SizedBox(
              height: Get.height * 0.04,
            ),
            Button(),
            SizedBox(
              height: Get.height * 0.4,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: CommonBtn(
                  onTap: () {
                    Get.to(() => const Category_Select_Screen());
                  },
                  title: Strings.continues.tr),
            ),
          ],
        ),
      ),
    );
  }
}
