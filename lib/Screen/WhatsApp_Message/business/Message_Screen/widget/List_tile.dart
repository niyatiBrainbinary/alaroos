
import 'package:alaroos/Common/text_style.dart';
import 'package:alaroos/Screen/WhatsApp_Message/business/Chat_Screen/chat_screen.dart';
import 'package:alaroos/Screen/WhatsApp_Message/business/Message_Screen/message_controller.dart';
import 'package:alaroos/Utils/assets_res.dart';
import 'package:alaroos/Utils/color_res.dart';
import 'package:alaroos/Utils/pref_key.dart';
import 'package:alaroos/Utils/string.dart';
import 'package:alaroos/service/pref_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class List_Tile extends StatelessWidget {
   List_Tile({Key? key}) : super(key: key);
MessageController messageController = Get.put(MessageController());
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream:FirebaseFirestore.instance.collection("Auth").doc("User").collection("UserEntry").snapshots(),
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
          messageController.getFirestoreData(snapshot.data.docs[i]['email']);

            return    GestureDetector(
            onTap: () async {
              await messageController.getRoomId( snapshot.data.docs[i]['email']);

              Get.to(() => Chat_Screen(
                myEmail: PrefService.getString(PrefKeys.emailBusiness),
                userName:  snapshot.data.docs[i]['firstName'],
                userEmail:  snapshot.data.docs[i]['email'],
              ));
            },
            child: ListTile(
              title: Text(
                snapshot.data.docs[i]['firstName'] ?? '',
                style: forgotPass,
              ),
              subtitle:     StreamBuilder(
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
                            .emailBusiness))) {
                          if (e
                              .data()['emailList']
                          [1]
                              .contains(snapshot
                              .data!
                              .docs[i]
                          ['email']
                              .toString())) {
                            messageController
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
                            .emailBusiness))) {
                          if (e
                              .data()['emailList']
                          [0]
                              .contains(snapshot
                              .data!
                              .docs[i]['email']
                              .toString())) {
                            messageController
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
                      messageController
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
                        messageController
                            .lastMessage[
                        i]
                            .toString()
                            .contains(
                            "https://firebasestorage.googleapis.com")
                            ? "Image"
                            : messageController.lastMessage[
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
                crossAxisAlignment: CrossAxisAlignment.end,
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
                                .emailBusiness))) {
                              if (e
                                  .data()['emailList']
                              [1]
                                  .contains(snapshot
                                  .data!
                                  .docs[i]
                              ['email']
                                  .toString())) {
                                messageController
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
                                .emailBusiness))) {
                              if (e
                                  .data()['emailList']
                              [0]
                                  .contains(snapshot
                                  .data!
                                  .docs[i]['email']
                                  .toString())) {
                                messageController
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
                          messageController
                              .lastMessageTime[
                          i] =null  ;
                        }

                        return snap.data?.docs !=
                            null &&
                            snap.data!.docs
                                .isEmpty
                            ? const SizedBox()
                            : (messageController.lastMessageTime[i] != null)?
                        Container(
                          width: 100,
                          alignment: Alignment
                              .centerRight,
                          child: Text(
                            messageController.formatTimestamp(messageController.lastMessageTime[i]),

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
                        () =>  (messageController.newMsgCount
                        .value !=
                        null &&
                        messageController.newMsgCount
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
                          (messageController.newMsgCount
                              .value[
                          i] ??
                              0)
                              .toString(),
                          style: notificationStyle),
                    ),
                  ),
                  /*Container(
                    height: Get.height * 0.05,
                    width: Get.width * 0.05,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: Center(
                      child: Text(
                        Strings.notification,
                        style: notificationStyle,
                      ),
                    ),
                  ),*/
                ],
              ),
            ),
          );}):const SizedBox();
    });
  }
}
