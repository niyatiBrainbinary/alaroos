
import 'dart:io';

import 'package:alaroos/Utils/color_res.dart';
import 'package:alaroos/Utils/pref_key.dart';
import 'package:alaroos/service/pref_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class MessageController extends GetxController {
  TextEditingController SearchMesgController = TextEditingController();
  TextEditingController chatController = TextEditingController();
  String uid = PrefService.getString(PrefKeys.emailBusiness);
  RxList newMsgCount = [].obs;
  RxBool loader = false.obs;
  String? roomEmail;
  List lastMessage = [];
  List lastMessageTime = [];

  DateTime lastMsg = DateTime.now();
  var imageChat;


  pickImage(context, roomId) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageChat = File(pickedFile!.path);

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                title: Text("Send Image"),
                content: Obx(
                      () => Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                          height: 300,
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          child: Image.file(File(pickedFile.path))),
                      loader.value ? const CircularProgressIndicator() : const SizedBox(),
                    ],
                  ),
                ),
                actions: [
                  InkWell(
                    onTap: () {
                      imageChat = null;
                      Get.back();
                    },
                    child: Container(
                      height: 40,
                      width: 90,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ColorRes.textColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await uploadImage(roomId);
                      Get.back();
                    },
                    child: Container(
                      height: 40,
                      width: 90,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ColorRes.textColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "Send",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  )
                ]);
          });
      print(pickedFile.path);
      update(['create_profile']);
    }
  }

  Future<void> uploadImage(String roomId) async {
    if (imageChat == null) return;

    loader.value = true;

    String fileName =
        'chat_images/${DateTime.now().millisecondsSinceEpoch}_${uid}_${imageChat!.path.split('/').last}';
    firebase_storage.Reference storageRef =
    firebase_storage.FirebaseStorage.instance.ref().child(fileName);

    try {
      firebase_storage.TaskSnapshot snapshot =
      await storageRef.putFile(imageChat!);

      String downloadUrl = await snapshot.ref.getDownloadURL();

      await sendImageMessage(roomEmail!, uid, downloadUrl);

      imageChat = null;

      loader.value = false;
    } on firebase_storage.FirebaseException catch (e) {
      print(e);
      loader.value = false;
    }
  }

  Future<void> sendImageMessage(
      String roomId, String senderUid, String imageUrl) async {
    final messagesRef = FirebaseFirestore.instance
        .collection("chats_user")
        .doc(roomId)
        .collection(roomId);

    await messagesRef.add({
      "content": imageUrl,
      "type": "image",
      "senderUid": senderUid,
      "time": DateTime.now(),
      "read": false,
    });

    await setLastMsgInDoc(imageUrl);
  }
  void sendMessage(String roomId, otherUid) async {
    DateTime now = DateTime.now().toUtc(); // Get current date and time in UTC

    String formattedDate = DateFormat('yyyy-MM-ddTHH:mm:ss.SSSZ').format(now);

    String msg = chatController.text;

    if (isToday(lastMsg) == false) {
      await sendAlertMsg();
    }

    await setMessage(
        roomEmail!, msg, PrefService.getString(PrefKeys.emailBusiness));

    setLastMsgInDoc(msg);
    update(['message']);
    String chatId =
    getChatId(PrefService.getString(PrefKeys.emailBusiness), otherUid);
    bool isLastMsg = false;
    print(chatId);

    // await FirebaseFirestore.instance
    //     .collection("chats_user")
    //     .doc(getChatId(
    //         PrefService.getString(PrefKeys.userEmail).toString(), otherUid))
    //     .get()
    //     .then((value) {
    //   print(value['lastMessage']);
    //   isLastMsg = value['lastMessageRead'];
    // });

  }


  Future<void> setMessage(String roomId, msg, userUid) async {
    await FirebaseFirestore.instance
        .collection("chats_user")
        .doc(roomId)
        .collection(roomId)
        .doc()
        .set({
      "content": msg,
      "type": "text",
      "senderUid": userUid,
      "time": DateTime.now(),
      "read": false,
    });
    chatController.clear();
    update(['message']);
  }

  Future<void> setLastMsgInDoc(String msg) async {
    await FirebaseFirestore.instance
        .collection("chats_user")
        .doc(roomEmail)
        .update({
      "lastMessage": msg,
      "lastMessageSender": uid,
      "lastMessageTime": DateTime.now(),
      "lastMessageRead": false,
    });
  }

  Future<void> sendAlertMsg() async {
    await FirebaseFirestore.instance
        .collection("chats_user")
        .doc(roomEmail)
        .collection(roomEmail!)
        .doc()
        .set({
      "content": "new Day",
      "senderUid": roomEmail,
      "type": "alert",
      "time": DateTime.now()
    });
  }
  String formatTimestamp(Timestamp timestamp) {
    var format =  DateFormat('HH:mm a'); // <- use skeleton here
    return format.format(timestamp.toDate());
  }
  bool isToday(DateTime time) {
    DateTime now = DateTime.now();

    if (now.year == time.year &&
        now.month == time.month &&
        now.day == time.day) {
      return true;
    }
    return false;
  }

  String getChatId(String email1, String email2) {
    if (email1.hashCode > email2.hashCode) {
      return '${email1}_$email2';
    } else {
      return '${email2}_$email1';
    }
  }

  getRoomId(String otherEmail) async {
    DocumentReference doc = FirebaseFirestore.instance
        .collection("chats_user")
        .doc(getChatId(PrefService.getString(PrefKeys.emailBusiness), otherEmail));

    await doc
        .collection(getChatId(
        PrefService.getString(PrefKeys.emailBusiness).toString(), otherEmail))
        .get()
        .then((value) async {
      DocumentSnapshot<Object?> i = await doc.get();
      if (i.exists == false) {
        await doc.set({
          "emailList": [PrefService.getString(PrefKeys.emailBusiness), otherEmail],
        });
      }
      if (value.docs.isNotEmpty) {
        roomEmail = getChatId(
            PrefService.getString(PrefKeys.emailBusiness).toString(), otherEmail);
      } else {
        await FirebaseFirestore.instance
            .collection("chats_user")
            .doc(getChatId(PrefService.getString(PrefKeys.emailBusiness).toString(),
            otherEmail))
            .collection(getChatId(
            PrefService.getString(PrefKeys.emailBusiness).toString(),
            otherEmail))
            .get()
            .then((value) {
          if (value.docs.isNotEmpty) {
            roomEmail = getChatId(
                PrefService.getString(PrefKeys.emailBusiness).toString(),
                otherEmail);
          } else {
            roomEmail = getChatId(
                PrefService.getString(PrefKeys.emailBusiness).toString(),
                otherEmail);
          }
        });
      }
    });
  }

  Future<void> setReadTrue(String docId) async {
    await FirebaseFirestore.instance
        .collection("chats_user")
        .doc(roomEmail)
        .collection(roomEmail!)
        .doc(docId)
        .update({"read": true});
    await setReadInChatDoc(true);
  }

  Future<void> setReadInChatDoc(bool status) async {
    await FirebaseFirestore.instance
        .collection("chats_user")
        .doc(roomEmail)
        .update({"lastMessageRead": status});
  }

  final ScrollController listScrollController = ScrollController();



  String timeAgo(DateTime d) {
    Duration diff = DateTime.now().difference(d);
    if (diff.inDays > 365) {
      return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"} ago";
    }
    if (diff.inDays > 30) {
      return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month" : "months"} ago";
    }
    if (diff.inDays > 7) {
      return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week" : "weeks"} ago";
    }
    if (diff.inDays > 0) {
      return "${diff.inDays} ${diff.inDays == 1 ? "day" : "days"} ago";
    }
    if (diff.inHours > 0) {
      return "${diff.inHours} ${diff.inHours == 1 ? "hour" : "hours"} ago";
    }
    if (diff.inMinutes > 0) {
      return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"} ago";
    }
    return "just now";
  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();

  }

  init() async {
    var allData =
    await FirebaseFirestore.instance.collection('Auth').doc("User").collection("UserEntry").get();

    allData.docs.forEach((element) {


          lastMessage = List.generate(allData.docs.length, (index) => "");
          lastMessageTime = List.generate(allData.docs.length, (index) => null);

          newMsgCount.value = List.generate(allData.docs.length, (index) => 0);


    });


  }

  getFirestoreData(String otherEmail) async {
    final chatLastMsgData = await FirebaseFirestore.instance
        .collection("chats_user")
        .where('emailList',
      arrayContains: PrefService.getString(PrefKeys.emailBusiness), )

        .get();
    for (var e = 0; e < chatLastMsgData.docs.length; e++) {

      if (chatLastMsgData.docs[e].data().containsKey("lastMessageRead")) {
        if (chatLastMsgData.docs[e]["lastMessageRead"] == true ||
            chatLastMsgData.docs[e]["lastMessageSender"] == uid) {
          newMsgCount.value[e] = 0;
        } else {
          newMsgCount.value[e] = await countUnreadMessagesUntilRead(getChatId(
              chatLastMsgData.docs[e]["emailList"][0],
              chatLastMsgData.docs[e]["emailList"][1]));
        }
        if(updateData)
        {
          update( ['chatBusiness']);
          updateData = false;
        }

      }
    }
    newMsgCount.refresh();
  }
bool updateData = false;
  countUnreadMessagesUntilRead(String roomId) async {
    CollectionReference messagesCollection = FirebaseFirestore.instance
        .collection('chats_user')
        .doc(roomId)
        .collection(roomId);

    QuerySnapshot querySnapshot =
    await messagesCollection.orderBy('time', descending: true).get();

    int unreadCount = 0;

    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      if (data['read'] == false) {
        updateData =true;
        await unreadCount++;
      } else {
        break;
      }
    }
    return await unreadCount;
  }



}
