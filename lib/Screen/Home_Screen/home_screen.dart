import 'package:alaroos/Common/common_btn.dart';
import 'package:alaroos/Common/text_style.dart';
import 'package:alaroos/Screen/Dashboard/Widgets/bottom_bar.dart';
import 'package:alaroos/Screen/Home_Screen/widget/container.dart';
import 'package:alaroos/Screen/WhatsApp_Message/business/Message_Screen/message_controller.dart';
import 'package:alaroos/Screen/WhatsApp_Message/business/Message_Screen/message_screen.dart';
import 'package:alaroos/Screen/WhatsApp_Message/user/Message_Screen_User/message_controller_user.dart';
import 'package:alaroos/Screen/WhatsApp_Message/user/Message_Screen_User/message_screen_user.dart';
import 'package:alaroos/Utils/assets_res.dart';
import 'package:alaroos/Utils/color_res.dart';
import 'package:alaroos/Utils/pref_key.dart';
import 'package:alaroos/service/pref_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../Utils/string.dart';
import 'Add_New_Post/add_new_post_screen.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text(
                  'Sure, You want to exit this app?',
                  style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                ),

                actions: <Widget>[
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(ColorRes.shareProfileChatColor),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text(
                      'No',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                     SystemNavigator.pop();

                    },
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    child: const Text('Yes',style:  TextStyle(color: Colors.black),),
                  ),
                  const SizedBox(width: 2),
                ],
              );
            });
        return true;
      },
      /*onWillPop: () async {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Sure, You want to exit this app?'),
              actions: [
                CupertinoButton(
                    child: Text('No'),
                    onPressed: () {
                      Get.back();
                    }),
                CupertinoButton(
                    child: Text('Yes'),
                    onPressed: () {
                      SystemNavigator.pop();
                    }),
              ],
            );
          },
        );
        SystemNavigator.pop();
        return true;
      },*/
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(CupertinoIcons.back),
          ),
          centerTitle: true,
          // shape: Border(bottom: BorderSide(color: ColorRes.textColor)),
          backgroundColor: ColorRes.btnColor,
          //automaticallyImplyLeading: false,
          toolbarHeight: Get.height * 0.13,
          title: Text(
            Strings.alaroos,
            style: appBarTitle,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => Add_New_Post());
                },
                icon: Icon(Icons.add)),
            IconButton(
              onPressed: () async {
                if (PrefService.getString(PrefKeys.type) == "business") {
                  MessageController messsageController =
                      Get.put(MessageController());
                  await messsageController.init();
                  Get.to(() => Message_Screen());
                } else {
                  MessageUserController messageUserController =
                      Get.put(MessageUserController());
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
        body: Container_Screen(),
        // bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
