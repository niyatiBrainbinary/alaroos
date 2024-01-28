
import 'package:alaroos/Common/text_style.dart';
import 'package:alaroos/Screen/WhatsApp_Message/business/Message_Screen/message_controller.dart';
import 'package:alaroos/Screen/WhatsApp_Message/business/Message_Screen/widget/List_tile.dart';
import 'package:alaroos/Utils/color_res.dart';
import 'package:alaroos/Utils/pref_key.dart';
import 'package:alaroos/Utils/string.dart';
import 'package:alaroos/service/pref_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          Strings.messages,
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
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search_rounded),
                        filled: true,
                        fillColor: ColorRes.serchTextfiled,
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: Strings.search),
                  ),
                ),
             List_Tile(),
              ],
            ),
          );
        },
      ),
    );
  }
}
