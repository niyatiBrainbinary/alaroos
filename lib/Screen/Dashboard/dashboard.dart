import 'package:alaroos/Screen/Account_Screen/account_screen.dart';
import 'package:alaroos/Screen/Dashboard/Widgets/bottom_bar.dart';
import 'package:alaroos/Screen/Home_Screen/home_screen.dart';
import 'package:alaroos/Screen/Search_Screen/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Common/text_style.dart';
import '../../Utils/color_res.dart';
import '../../Utils/string.dart';
import 'dashboard_controller.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController =
        Get.put(DashboardController());
    return Scaffold(
      body: GetBuilder<DashboardController>(
        id: 'b',
        builder: (controller) {
          return Container(
            height: 400,
            width: 200,
            color: Colors.deepPurpleAccent,
            child: PageView(
              controller: dashboardController.pageController,
              children: List.generate(dashboardController.bottomPages.length,
                  (index) => dashboardController.bottomPages[index]),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
