import 'package:alaroos/Screen/Account_Screen/account_screen.dart';
import 'package:alaroos/Screen/Home_Screen/home_screen.dart';
import 'package:alaroos/Screen/Search_Screen/search_screen.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';

import '../../../Utils/color_res.dart';
import '../dashboard_controller.dart';
import 'bottom_controller.dart';


class BottomBar extends StatelessWidget {
   BottomBar({Key? key}) : super(key: key);
   final _pageController = PageController();
   final BottomBarController _controller = Get.put(BottomBarController());
   GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: PageView(
      controller: _pageController,
      children: const <Widget>[

        Home_Screen(),
        Search_Screen(),
        Account_Screen(),
      ],
      onPageChanged: (index) {
        _controller.changePage(index);
      },
    ),
      extendBody: true,
      bottomNavigationBar: Obx(() => CurvedNavigationBar(
        key: bottomNavigationKey,
        index: _controller.currentPage.value,
        items: const [
          CurvedNavigationBarItem(
            child: Icon(Icons.home_outlined,),
            label: 'Home',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.search),
            label: 'Search',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.person_2_outlined),
            label: 'Account',
          ),
        ],
        color: ColorRes.btnColor,
        buttonBackgroundColor: ColorRes.btnColor,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          _controller.changePage(index);
          _pageController.jumpToPage(index);
          // setState(() {
          //   _page = index;
          // });
        },
        letIndexChange: (index) => true,
      ),),

    );
  }
}
