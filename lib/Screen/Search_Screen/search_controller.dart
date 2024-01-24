import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Utils/string.dart';

class Search_Controller extends GetxController {
  TextEditingController SearchController = TextEditingController();
  String search = "";
  void setSearch(String value) {
    search = value.trim();  update(['search']);
  }

  validateUserName() {
    if (SearchController.text.trim() == "") {
      search = Strings.usernameerrorMessage;
    } else {
      search = "";
    }
    update(['search']);
  }
}
