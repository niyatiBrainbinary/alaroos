
import 'package:alaroos/Common/text_style.dart';
import 'package:alaroos/Screen/WhatsApp_Message/user/Message_Screen_User/message_controller_user.dart';
import 'package:alaroos/Screen/WhatsApp_Message/user/Message_Screen_User/widget/List_tile_user.dart';
import 'package:alaroos/Utils/color_res.dart';
import 'package:alaroos/Utils/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Message_ScreenUser extends StatelessWidget {
  const Message_ScreenUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MessageUserController messageUSerController = Get.put(MessageUserController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(CupertinoIcons.back),
        ),
        shape: const Border(bottom: BorderSide(color: ColorRes.textColor)),
        backgroundColor: ColorRes.btnColor,
        toolbarHeight: Get.height * 0.13,
        title: Text(
          Strings.messages,
          style: splashSubTitle,
        ),
        centerTitle: true,
      ),
      body: GetBuilder<MessageUserController>(
        builder: (controller) {
          // return List_Tile();
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    controller: messageUSerController.SearchMesgController,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search_rounded),
                        filled: true,
                        fillColor: ColorRes.serchTextfiled,
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: Strings.search),
                  ),
                ),
             List_TileUser(),
              ],
            ),
          );
        },
      ),
    );
  }
}
