import 'package:alaroos/Screen/Splash/splash_screen.dart';
import 'package:alaroos/Utils/color_res.dart';
import 'package:alaroos/service/localization.dart';
import 'package:alaroos/service/pref_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      title: 'Alaroos',
      theme: ThemeData(
        primaryColor: ColorRes.themeColor,
      ),
      debugShowCheckedModeBanner: false,
      home: const Splash_Screen(),
    );
  }
}
