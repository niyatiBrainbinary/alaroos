import 'package:alaroos/Screen/WhatsApp_Message/Message_Screen/message_controller.dart';
import 'package:alaroos/Screen/WhatsApp_Message/Message_Screen/widget/List_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Common/text_style.dart';
import '../../../Utils/assets_res.dart';
import '../../../Utils/color_res.dart';
import '../../../Utils/string.dart';

class Message_Screen extends StatelessWidget {
  const Message_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MessageController messageController = Get.put(MessageController());
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
          Strings.messages.tr,
          style: splashSubTitle,
        ),
        centerTitle: true,
      ),
      body: GetBuilder<MessageController>(
        builder: (controller) {
          // return List_Tile();
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    controller: messageController.SearchMesgController,
                    decoration:  InputDecoration(
                        prefixIcon: const Icon(Icons.search_rounded),
                        filled: true,
                        fillColor: ColorRes.serchTextfiled,
                        border: const OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: Strings.search.tr),
                  ),
                ),
                const List_Tile(),
              ],
            ),
          );
        },
      ),
    );
  }
}
