import 'package:alaroos/Screen/WhatsApp_Message/Chat_Screen/chat_controller.dart';
import 'package:alaroos/Screen/WhatsApp_Message/Chat_Screen/widget/chat_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Common/text_style.dart';
import '../../../Utils/assets_res.dart';
import '../../../Utils/color_res.dart';
import '../../../Utils/string.dart';

class Chat_Screen extends StatelessWidget {
  Chat_Screen({Key? key}) : super(key: key);
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final ChatController chatController = Get.put(ChatController());
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
          title: Row(
            children: [
              CircleAvatar(
                radius: Get.height * 0.033,
                foregroundImage: AssetImage(AssetsRes.userImage),
              ),
              SizedBox(
                width: Get.width * 0.02,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.username,
                    style: forgotPass,
                  ),
                  Text(
                    Strings.online,
                    style: donthaveac,
                  ),
                ],
              )
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.video_camera,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.phone,
              ),
            ),
          ],
        ),
        body: GetBuilder<ChatController>(
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  const Expanded(
                    flex: 10,
                    child: ChatWidget(),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: Get.width*0.88,
                              child: Card(
                                margin: const EdgeInsets.only(
                                    left: 2, right: 2, bottom: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: TextFormField(
                                  controller: chatController.chatController,
                                  focusNode: focusNode,
                                  textAlignVertical: TextAlignVertical.center,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 5,
                                  minLines: 1,
                                  onChanged: (value) {
                                    // if (value.length > 0) {
                                    //   setState(() {
                                    //     sendButton = true;
                                    //   });
                                    // } else {
                                    //   setState(() {
                                    //     sendButton = false;
                                    //   });
                                    // }
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Type a message",
                                    hintStyle: const TextStyle(color: Colors.grey),
                                    prefixIcon: IconButton(
                                      icon: const Icon(
                                        Icons.emoji_emotions_outlined,
                                        size: 30,
                                      ),
                                      onPressed: () {
                                        // if (!show) {
                                        //   focusNode.unfocus();
                                        //   focusNode.canRequestFocus = false;
                                        // }
                                        // setState(() {
                                        //   show = !show;
                                        // });
                                      },
                                    ),
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: Get.height*0.025,
                                        backgroundColor: ColorRes.textColor,
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.send,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            // if (sendButton) {
                                            //   _scrollController.animateTo(
                                            //       _scrollController
                                            //           .position.maxScrollExtent,
                                            //       duration:
                                            //       Duration(milliseconds: 300),
                                            //       curve: Curves.easeOut);
                                            //   sendMessage(
                                            //       _controller.text,
                                            //       widget.sourchat.id,
                                            //       widget.chatModel.id);
                                            //   _controller.clear();
                                            //   setState(() {
                                            //     sendButton = false;
                                            //   });
                                            // }
                                          },
                                        ),
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.all(5),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // show ? emojiSelect() : Container(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
