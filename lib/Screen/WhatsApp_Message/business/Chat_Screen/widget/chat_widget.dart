import 'package:alaroos/Common/text_style.dart';
import 'package:alaroos/Utils/assets_res.dart';
import 'package:alaroos/Utils/color_res.dart';
import 'package:alaroos/Utils/string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //const Spacer(),
            SizedBox(
              height: Get.height * 0.3,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: Get.height * 0.09,
                        width: Get.width * 0.7,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            color: ColorRes.btnColor),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              Strings.chat1,
                              style: chatStyle,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        Strings.time,
                        style: subTitleStyle,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.02,
                ),
                CircleAvatar(
                  radius: Get.height * 0.033,
                  foregroundImage: const AssetImage(AssetsRes.userImage),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: Get.height * 0.033,
                  foregroundImage: const AssetImage(AssetsRes.userImage2),
                ),
                SizedBox(
                  width: Get.width * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: Get.height * 0.09,
                        width: Get.width * 0.7,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            color: ColorRes.chat2),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              Strings.chat1,
                              style: chatStyle,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        Strings.time,
                        style: subTitleStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: Get.height * 0.09,
                        width: Get.width * 0.7,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            color: ColorRes.btnColor),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              Strings.chat2,
                              style: chatStyle,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        Strings.time,
                        style: subTitleStyle,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.02,
                ),
                CircleAvatar(
                  radius: Get.height * 0.033,
                  foregroundImage: const AssetImage(AssetsRes.userImage),
                ),
              ],
            ),

            SizedBox(
              height: Get.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: Get.height * 0.033,
                  foregroundImage: const AssetImage(AssetsRes.userImage2),
                ),
                SizedBox(
                  width: Get.width * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: Get.height * 0.225,
                          width: Get.width * 0.6,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              color: ColorRes.chat2),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  height: Get.height * 0.1,
                                  width: Get.width * 0.6,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      color: ColorRes.shareProfileChatColor),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: Get.height * 0.033,
                                          foregroundImage: const AssetImage(
                                              AssetsRes.userImage2),
                                        ),
                                        SizedBox(width: Get.width * 0.02),
                                         const Center(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                Strings.username2,
                                                //style: subTitleStyle,
                                              ),
                                              Text(
                                                Strings.artline,
                                                //style: subTitleStyle,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: Get.height*0.01),
                                const Text(Strings.chatLink),
                              ],
                            ),
                          )),
                      Text(
                        Strings.time,
                        style: subTitleStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
