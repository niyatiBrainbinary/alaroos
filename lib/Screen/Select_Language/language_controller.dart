import 'package:get/get.dart';

class LanguageController extends GetxController {
  var selectedLanguage = "English".obs;

  void setLanguage(String language) {
    selectedLanguage.value = language;
  }
}
