
import 'package:alaroos/Common/text_style.dart';
import 'package:alaroos/Screen/WhatsApp_Message/business/Chat_Screen/chat_screen.dart';
import 'package:alaroos/Screen/WhatsApp_Message/business/Message_Screen/message_controller.dart';
import 'package:alaroos/Screen/WhatsApp_Message/user/Chat_Screen_user/chat_screen_user.dart';
import 'package:alaroos/Screen/WhatsApp_Message/user/Message_Screen_User/message_controller_user.dart';
import 'package:alaroos/Utils/assets_res.dart';
import 'package:alaroos/Utils/color_res.dart';
import 'package:alaroos/Utils/pref_key.dart';
import 'package:alaroos/Utils/string.dart';
import 'package:alaroos/service/pref_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class List_TileUser extends StatelessWidget {
  List_TileUser({Key? key}) : super(key: key);
MessageUserController messageUserController = Get.put(MessageUserController());
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream:FirebaseFirestore.instance.collection("Auth").doc("Business").collection("BusinessEntry").snapshots(),
        builder: (context,AsyncSnapshot snapshot){
          if (snapshot.hasData == false) {
            return const SizedBox();
          }
      return (snapshot.data != null)
      ?ListView.builder(
        shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: snapshot.data.docs.length,
          itemBuilder: (context,i){
            messageUserController.getFirestoreData(snapshot.data.docs[i]['businessEmail']);
          return    GestureDetector(
            onTap: () async {
              await messageUserController.getRoomId( snapshot.data.docs[i]['businessEmail']);

              Get.to(() => ChatUserScreen(
                myEmail: PrefService.getString(PrefKeys.emailBusiness),
                userName:  snapshot.data.docs[i]['firstName'],
                userEmail:  snapshot.data.docs[i]['businessEmail'],
              ));
            },
            child: ListTile(
              title: Text(
                snapshot.data.docs[i]['firstName'] ?? '',
                style: forgotPass,
              ),
              subtitle:   StreamBuilder(
                  stream: FirebaseFirestore
                      .instance
                      .collection("chats_user")
                      .snapshots(),
                  builder: (context, snap) {
                    if (snap.data != null) {
                      var doc = snap.data!.docs;
                      doc.forEach((e) {
                        if (e
                            .data()['emailList']
                        [0]
                            .contains(PrefService
                            .getString(PrefKeys
                            .email))) {
                          if (e
                              .data()['emailList']
                          [1]
                              .contains(snapshot
                              .data!
                              .docs[i]
                          ['businessEmail']
                              .toString())) {
                            messageUserController
                                .lastMessage[
                            i] = e
                                .data()[
                            'lastMessage'];
                          }
                        } else if (e
                            .data()['emailList']
                        [1]
                            .contains(PrefService
                            .getString(PrefKeys
                            .email))) {
                          if (e
                              .data()['emailList']
                          [0]
                              .contains(snapshot
                              .data!
                              .docs[i]['businessEmail']
                              .toString())) {
                            messageUserController
                                .lastMessage[
                            i] = e
                                .data()[
                            'lastMessage'];
                          }
                        }
                      });
                    }
                    else
                    {
                      messageUserController
                          .lastMessage[
                      i] =""  ;
                    }

                    return snap.data?.docs !=
                        null &&
                        snap.data!.docs
                            .isEmpty
                        ? const SizedBox()
                        : Container(
                      alignment: Alignment
                          .centerLeft,
                      child: Text(
                        messageUserController
                            .lastMessage[
                        i]
                            .toString()
                            .contains(
                            "https://firebasestorage.googleapis.com")
                            ? "Image"
                            : messageUserController.lastMessage[
                        i] ??
                            "",
                        overflow:
                        TextOverflow
                            .ellipsis,
                        maxLines: 1,
                        style:
                        const TextStyle(
                            fontSize:
                            14,
                            color: Colors
                                .grey),
                      ),
                    );
                  }),
              leading: CircleAvatar(
                radius: Get.height * 0.033,
                foregroundImage: const AssetImage(AssetsRes.userImage),
              ),
              trailing: Column(
                children: [

                  StreamBuilder(
                      stream: FirebaseFirestore
                          .instance
                          .collection("chats_user")
                          .snapshots(),
                      builder: (context, snap) {
                        if (snap.data != null) {
                          var doc = snap.data!.docs;
                          doc.forEach((e) {
                            if (e
                                .data()['emailList']
                            [0]
                                .contains(PrefService
                                .getString(PrefKeys
                                .email))) {
                              if (e
                                  .data()['emailList']
                              [1]
                                  .contains(snapshot
                                  .data!
                                  .docs[i]
                              ['businessEmail']
                                  .toString())) {
                                messageUserController
                                    .lastMessageTime[
                                i] = e
                                    .data()[
                                'lastMessageTime'];
                              }
                            } else if (e
                                .data()['emailList']
                            [1]
                                .contains(PrefService
                                .getString(PrefKeys
                                .email))) {
                              if (e
                                  .data()['emailList']
                              [0]
                                  .contains(snapshot
                                  .data!
                                  .docs[i]['businessEmail']
                                  .toString())) {
                                messageUserController
                                    .lastMessageTime[
                                i] = e
                                    .data()[
                                'lastMessageTime'];
                              }
                            }
                          });
                        }
                        else
                        {
                          messageUserController
                              .lastMessageTime[
                          i] =null  ;
                        }

                        return snap.data?.docs !=
                            null &&
                            snap.data!.docs
                                .isEmpty
                            ? const SizedBox()
                            : (messageUserController.lastMessageTime[i] != null)?
                        Container(
                          width: 100,
                          alignment: Alignment
                              .centerRight,
                          child: Text(
                            messageUserController.formatTimestamp(messageUserController.lastMessageTime[i]),

                            overflow:
                            TextOverflow
                                .ellipsis,
                            maxLines: 1,
                            style:
                            const TextStyle(
                                fontSize:
                                14,
                                color: Colors
                                    .grey),
                          ),
                        ):const SizedBox();
                      }),

                  Obx(
                        () =>  (messageUserController.newMsgCount
                        .value !=
                        null &&
                        messageUserController.newMsgCount
                            .value[
                        i] ==
                            0)
                        ? const SizedBox()
                        : Container(
                      alignment:
                      Alignment.center,
                      height: Get.height *
                          0.035,
                      width: Get.height *
                          0.035,
                      decoration:
                      const BoxDecoration(
                          color: ColorRes
                              .textColor,
                          shape: BoxShape
                              .circle),
                      child: Text(
                          (messageUserController.newMsgCount
                              .value[
                          i] ??
                              0)
                              .toString(),
                          style: notificationStyle),
                    ),
                  ),
                ],
              ),
            ),
          );}):const SizedBox();
    });
  }
}
