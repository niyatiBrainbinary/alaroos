import 'package:alaroos/Screen/WhatsApp_Message/Chat_Screen/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Common/text_style.dart';
import '../../../../Utils/assets_res.dart';
import '../../../../Utils/string.dart';

class List_Tile extends StatelessWidget {
  const List_Tile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(() => Chat_Screen());
          },
          child: ListTile(
            title: Text(
              Strings.username,
              style: forgotPass,
            ),
            subtitle: Text(
              Strings.trueline,
              style: donthaveac,
            ),
            leading: CircleAvatar(
              radius: Get.height * 0.033,
              foregroundImage: AssetImage(AssetsRes.userImage),
            ),
            trailing: Column(
              children: [
                Text(
                  Strings.time,
                  style: subTitleStyle,
                ),
                Container(
                  height: Get.height * 0.05,
                  width: Get.width * 0.05,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Text(
                      Strings.notification,
                      style: notificationStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Divider(),
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => Chat_Screen());
          },
          child: ListTile(
            title: Text(
              Strings.username,
              style: forgotPass,
            ),
            subtitle: Text(
              Strings.trueline,
              style: donthaveac,
            ),
            leading: CircleAvatar(
              radius: Get.height * 0.033,
              foregroundImage: AssetImage(AssetsRes.userImage),
            ),
            trailing: Column(
              children: [
                Text(
                  Strings.time,
                  style: subTitleStyle,
                ),
                Container(
                  height: Get.height * 0.05,
                  width: Get.width * 0.05,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Text(
                      Strings.notification,
                      style: notificationStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Divider(),
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => Chat_Screen());
          },
          child: ListTile(
            title: Text(
              Strings.username,
              style: forgotPass,
            ),
            subtitle: Text(
              Strings.trueline,
              style: donthaveac,
            ),
            leading: CircleAvatar(
              radius: Get.height * 0.033,
              foregroundImage: AssetImage(AssetsRes.userImage),
            ),
            trailing: Column(
              children: [
                Text(
                  Strings.time,
                  style: subTitleStyle,
                ),
                Container(
                  height: Get.height * 0.05,
                  width: Get.width * 0.05,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Text(
                      Strings.notification,
                      style: notificationStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Divider(),
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => Chat_Screen());
          },
          child: ListTile(
            title: Text(
              Strings.username,
              style: forgotPass,
            ),
            subtitle: Text(
              Strings.trueline,
              style: donthaveac,
            ),
            leading: CircleAvatar(
              radius: Get.height * 0.033,
              foregroundImage: AssetImage(AssetsRes.userImage),
            ),
            trailing: Column(
              children: [
                Text(
                  Strings.time,
                  style: subTitleStyle,
                ),
                Container(
                  height: Get.height * 0.05,
                  width: Get.width * 0.05,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Text(
                      Strings.notification,
                      style: notificationStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Divider(),
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => Chat_Screen());
          },
          child: ListTile(
            title: Text(
              Strings.username,
              style: forgotPass,
            ),
            subtitle: Text(
              Strings.trueline,
              style: donthaveac,
            ),
            leading: CircleAvatar(
              radius: Get.height * 0.033,
              foregroundImage: AssetImage(AssetsRes.userImage),
            ),
            trailing: Column(
              children: [
                Text(
                  Strings.time,
                  style: subTitleStyle,
                ),
                Container(
                  height: Get.height * 0.05,
                  width: Get.width * 0.05,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Text(
                      Strings.notification,
                      style: notificationStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Divider(),
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => Chat_Screen());
          },
          child: ListTile(
            title: Text(
              Strings.username,
              style: forgotPass,
            ),
            subtitle: Text(
              Strings.trueline,
              style: donthaveac,
            ),
            leading: CircleAvatar(
              radius: Get.height * 0.033,
              foregroundImage: AssetImage(AssetsRes.userImage),
            ),
            trailing: Column(
              children: [
                Text(
                  Strings.time,
                  style: subTitleStyle,
                ),
                Container(
                  height: Get.height * 0.05,
                  width: Get.width * 0.05,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Text(
                      Strings.notification,
                      style: notificationStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Divider(),
        ),
      ],
    );
  }
}
