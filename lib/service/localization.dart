
import 'package:alaroos/service/pref_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Languages/arabic.dart';
import '../Languages/english.dart';
import '../Utils/pref_key.dart';

class LocalizationService extends Translations {
  static  var locale = (PrefService.getString(PrefKeys.language)== "")
      ? const Locale("en", "EN")
      : (PrefService.getString(PrefKeys.language)== "English")
      ? const Locale("en", "EN")
      : (PrefService.getString(PrefKeys.language)== "Arabic")
      ? const Locale("ar", "AR")
      : const Locale("en", "EN");

  static const fallbackLocale = Locale("tr", "TR");
  static final language = ["English", "Arabic"];
  static final locales = [
    const Locale("en", "EN"),
    const Locale("ar", "AR"),
  ];
  @override
  Map<String, Map<String, String>> get keys => {
    'ar_AR': Arabic,
    'en_EN': English,
  };

  void changeLocale(String lang) {

    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale!);
    print(locale);

  }

  Locale? _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < language.length; i++) {
      debugPrint("You selected : ${language[i]}");
      if (lang == language[i]){
        print(language[i]);
        print(lang);
        PrefService.setValue(PrefKeys.language,language[i]);
        return locales[i];
      }
    }
    return Get.locale;
  }
}
