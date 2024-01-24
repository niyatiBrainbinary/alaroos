import 'package:alaroos/Screen/Account_Screen/account_screen.dart';
import 'package:alaroos/Screen/Home_Screen/home_screen.dart';
import 'package:alaroos/Screen/Search_Screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Account_Screen/account_controller.dart';
import '../Home_Screen/home_controller.dart';
import '../Search_Screen/search_controller.dart';

class DashboardController extends GetxController {

  int currentTab = 0;
  PageController pageController = PageController();

  final HomeController homeController = Get.put(HomeController());
  final Search_Controller searchController = Get.put(Search_Controller());
  final Account_Controller accountController = Get.put(Account_Controller());

  List bottomPages = [
    Home_Screen(),
    Search_Screen(),
    Account_Screen(),
  ];
  void onBottomBarChange(int index) {
    currentTab = index;
    if (index == 0) {
        homeController;
    } else if (index == 1) {
      searchController;
    } else {
      accountController;
    }
    update(['b']);
  }
}



