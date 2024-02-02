import 'package:alaroos/Screen/Home_Screen/Add_New_Post/add_new_post_controller.dart';
import 'package:alaroos/Screen/Setting_Screen/setting_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Common/text_style.dart';
import '../../Utils/color_res.dart';
import '../../Utils/string.dart';
import '../Dashboard/dashboard_controller.dart';
import '../Home_Screen/Home_details/Components/Gallery/gallery.dart';
import '../Home_Screen/Home_details/Components/Reels/reels.dart';
import 'Profile_Screen/widget/profile.dart';

class Account_Screen extends StatelessWidget {
  const Account_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddNewPostController addNewPostController = Get.put(AddNewPostController());
    addNewPostController.callApiGetAllPost();

    return WillPopScope(
      onWillPop: () async {
        DashboardController dashboardController =
        Get.put(DashboardController());
        dashboardController.currentTab = 0;
        dashboardController.update(['b']);
        addNewPostController.update(['search']);
        return false;
      },

      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(CupertinoIcons.back),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.to(() => Setting_Screen());
              },
              icon: const Icon(CupertinoIcons.settings),
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
        body: Stack(
          children: [
            DefaultTabController(
              length: 2,
              child: NestedScrollView(
                headerSliverBuilder: (context, _) {
                  return [
                  GetBuilder<AddNewPostController>(id:'p',builder: (controller) {
                    return   SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          profile(context,addNewPostController),
                        ],
                      ),
                    );
                  },)
                  ];
                },
                body: Column(
                  children: <Widget>[
                     const Material(
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
                          const Reels(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Obx(() => addNewPostController.isLoading.isTrue
                ? const Center(child: CircularProgressIndicator())
                : const SizedBox())
          ],
        ),
      ),
    );
  }
}
