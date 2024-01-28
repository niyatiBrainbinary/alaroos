import 'package:alaroos/Common/text_style.dart';
import 'package:alaroos/Screen/WhatsApp_Message/business/Message_Screen/message_controller.dart';
import 'package:alaroos/Screen/WhatsApp_Message/user/Message_Screen_User/message_controller_user.dart';
import 'package:alaroos/Utils/assets_res.dart';
import 'package:alaroos/Utils/color_res.dart';
import 'package:alaroos/Utils/string.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatUserScreen extends StatelessWidget {
  String userEmail;
  String myEmail;
  String userName;

  ChatUserScreen({
    required this.userEmail,
    required this.userName,
    required this.myEmail,

    Key? key}) : super(key: key);
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    MessageUserController messageUserController = Get.put(MessageUserController());
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
                    userName,
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
        body: GetBuilder<MessageUserController>(
          id: 'chat',
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  /*const Expanded(
                    flex: 10,
                    child: ChatWidget(),
                  ),*/
                  Expanded(
                    flex: 10,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("chats_user")
                          .doc(controller.roomEmail)
                          .collection(controller.roomEmail!)
                          .orderBy("time", descending: true)
                          .limit(1000)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return const SizedBox();
                          default:

                            List<DocumentSnapshot> documents =
                                snapshot.data!.docs;
                            return ListView.builder(
                              controller: controller.listScrollController,
                              reverse: true,
                              itemCount: documents.length,
                              itemBuilder: (context, index) {
                                // Check for the end of the list to load more
                                if (index >= documents.length - 1) {
                                  // Load more items
                                }
                                Map<String, dynamic>? data = documents[index]
                                    .data() as Map<String, dynamic>?;
                                if (data == null) {
                                  return const SizedBox();
                                } else {
                                  if (data['read'] != true &&
                                      data['senderUid'].toString() != myEmail) {
                                    controller.setReadTrue(
                                      documents[index].id,
                                    );
                                  }

                                  return documents[index]["senderUid"] !=
                                      controller.uid
                                      ? Padding(
                                    padding:
                                    const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        /*       Container(
                                          height: Get.height * 0.05,
                                          width: Get.height * 0.05,
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle),
                                          clipBehavior: Clip.hardEdge,
                                          child: SizedBox(
                                              height: 35,
                                              width: 35,
                                              child: CachedNetworkImage(
                                                  imageUrl: image,
                                                  fit: BoxFit.cover,
                                                  placeholder: (context, url) => Image.asset(AssetRes.user),
                                                  errorWidget: (context, url, error) => Image.asset(AssetRes.user))),
                                        ),*/
                                        const SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                          children: [
                                          /*  documents[index]["type"] ==
                                                "image"
                                                ? Container(
                                              height: 150,
                                              width: 150,
                                              decoration:
                                              BoxDecoration(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(
                                                    15),
                                              ),
                                              clipBehavior:
                                              Clip.hardEdge,
                                              child: CachedNetworkImage(
                                                  imageUrl:
                                                  documents[
                                                  index]
                                                  [
                                                  "content"],
                                                  fit: BoxFit.fill,
                                                  placeholder: (context,
                                                      url) =>
                                                      Image.asset(
                                                          AssetRes
                                                              .user),
                                                  errorWidget: (context,
                                                      url,
                                                      error) =>
                                                      Image.asset(
                                                          AssetRes
                                                              .user)),
                                            )
                                                : */

                                            IntrinsicWidth(
                                              child: Container(
                                                padding: EdgeInsets
                                                    .symmetric(
                                                  horizontal:
                                                  Get.width *
                                                      0.05,
                                                  vertical:
                                                  Get.width *
                                                      0.03,
                                                ),
                                                margin:
                                                const EdgeInsets
                                                    .only(
                                                    bottom: 5),
                                                decoration: const BoxDecoration(
                                                    borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(10),
                                                      topRight: Radius.circular(10),
                                                      bottomLeft: Radius.circular(10),
                                                    ),
                                                    color: ColorRes.btnColor
                                                ),
                                                alignment: Alignment
                                                    .center,
                                                constraints:
                                                BoxConstraints(
                                                  maxWidth:
                                                  Get.width /
                                                      1.5,
                                                ),
                                                child: Text(
                                                  documents[index]
                                                  ["content"],
                                                  style:  chatStyle,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              DateFormat("hh:mm aa")
                                                  .format(DateTime
                                                  .fromMillisecondsSinceEpoch(
                                                  documents[index]
                                                  [
                                                  "time"]
                                                      .seconds *
                                                      1000)),
                                              style: subTitleStyle,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                      : Padding(
                                    padding:
                                    const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.end,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                           /* documents[index]["type"] ==
                                                "image"
                                                ? Container(
                                              height: 150,
                                              width: 150,
                                              decoration:
                                              BoxDecoration(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(
                                                    15),
                                              ),
                                              clipBehavior:
                                              Clip.hardEdge,
                                              child: CachedNetworkImage(
                                                  imageUrl:
                                                  documents[
                                                  index]
                                                  [
                                                  "content"],
                                                  fit: BoxFit.fill,
                                                  placeholder: (context,
                                                      url) =>
                                                      Image.asset(
                                                          AssetRes
                                                              .user),
                                                  errorWidget: (context,
                                                      url,
                                                      error) =>
                                                      Image.asset(
                                                          AssetRes
                                                              .user)),
                                            )
                                                :*/
                                            IntrinsicWidth(
                                              child: Container(
                                                padding: EdgeInsets
                                                    .symmetric(
                                                  horizontal:
                                                  Get.width *
                                                      0.05,
                                                  vertical:
                                                  Get.width *
                                                      0.03,
                                                ),
                                                margin:
                                                const EdgeInsets
                                                    .only(
                                                    bottom: 5),
                                                decoration: const BoxDecoration(
                                                    borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(10),
                                                      topRight: Radius.circular(10),
                                                      bottomLeft: Radius.circular(10),
                                                    ),
                                                    color: ColorRes.btnColor
                                                ),
                                                alignment: Alignment
                                                    .center,
                                                constraints:
                                                BoxConstraints(
                                                  maxWidth:
                                                  Get.width /
                                                      1.5,
                                                ),
                                                child: Text(
                                                  documents[index]
                                                  ["content"],
                                                  style: chatStyle,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            Align(
                                              alignment:
                                              Alignment.centerRight,
                                              child: Text(
                                                DateFormat("hh:mm aa").format(
                                                    DateTime.fromMillisecondsSinceEpoch(
                                                        documents[index][
                                                        "time"]
                                                            .seconds *
                                                            1000)),
                                                style: subTitleStyle,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 10),
                                        /*      Container(
                                          height: Get.height * 0.05,
                                          width: Get.height * 0.05,
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle),
                                          clipBehavior: Clip.hardEdge,
                                          child: SizedBox(
                                              height: 35,
                                              width: 35,
                                              child: CachedNetworkImage(
                                                  imageUrl: myName ?? "", fit: BoxFit.cover,
                                                  placeholder: (context, url) => Image.asset(AssetRes.user),
                                                  errorWidget: (context, url, error) => Image.asset(AssetRes.user))),
                                        ),*/
                                      ],
                                    ),
                                  );
                                }
                              },
                            );
                        }
                      },
                    ),
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
                                  controller: messageUserController.chatController,
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
                                            if (controller.chatController.text
                                                .isNotEmpty) {
                                              controller.sendMessage(
                                                  myEmail!, userEmail);
                                            }
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
