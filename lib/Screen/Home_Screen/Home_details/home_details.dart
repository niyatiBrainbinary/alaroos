import 'package:alaroos/Screen/Dashboard/Widgets/bottom_bar.dart';
import 'package:alaroos/Screen/Home_Screen/Home_details/widget/profile_header_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Common/text_style.dart';
import '../../../Utils/assets_res.dart';
import '../../../Utils/color_res.dart';
import '../../../Utils/string.dart';
import 'Components/Gallery/gallery.dart';
import 'Components/Reels/reels.dart';

class Home_Details_Screen extends StatelessWidget {
  const Home_Details_Screen({Key? key}) : super(key: key);

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
        shape: Border(bottom: BorderSide(color: ColorRes.textColor)),
        backgroundColor: ColorRes.btnColor,
        toolbarHeight: Get.height * 0.13,
        title: Text(
          Strings.trueline,
          style: splashSubTitle,
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
                    profileHeaderWidget(context),
                  ],
                ),
              ),
            ];
          },
          body:  Column(
            children: <Widget>[
              Material(

                child: TabBar(unselectedLabelColor: ColorRes.textfiledBorder,
                  labelColor: ColorRes.textColor,
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.image_outlined,
                        //color: ColorRes.textColor,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.video_camera_back_outlined,
                       // color: ColorRes.textColor,
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
