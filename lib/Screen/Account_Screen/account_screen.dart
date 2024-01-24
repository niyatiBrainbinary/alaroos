import 'package:alaroos/Screen/Setting_Screen/setting_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Common/text_style.dart';
import '../../Utils/color_res.dart';
import '../../Utils/string.dart';
import '../Home_Screen/Home_details/Components/Gallery/gallery.dart';
import '../Home_Screen/Home_details/Components/Reels/reels.dart';
import '../Home_Screen/Home_details/widget/profile_header_widget.dart';
import 'Profile_Screen/widget/profile.dart';

class Account_Screen extends StatelessWidget {
  const Account_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(CupertinoIcons.back),
        ),
        actions: [
          IconButton(
            onPressed: () {Get.to(()=>Setting_Screen());},
            icon: Icon(CupertinoIcons.settings),
          ),
        ],
        shape: const Border(bottom: BorderSide(color: ColorRes.textColor)),
        backgroundColor: ColorRes.btnColor,
        toolbarHeight: Get.height * 0.13,
        title: Text(
          Strings.artline,
          style: forgotPass,
        ),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    profile(context),
                  ],
                ),
              ),
            ];
          },
          body: const Column(
            children: <Widget>[
              Material(
                color: Colors.white,
                child: TabBar(
                  unselectedLabelColor: ColorRes.textfiledBorder,
                  labelColor: ColorRes.textColor,
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.image_outlined,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.video_camera_back_outlined,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Gallery(),
                    Reels(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
