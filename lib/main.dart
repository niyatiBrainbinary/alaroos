import 'package:alaroos/Screen/Dashboard/dashboard.dart';
import 'package:alaroos/Screen/Splash/splash_screen.dart';
import 'package:alaroos/Utils/color_res.dart';
import 'package:alaroos/service/pref_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  runApp(const MyApp());
  await PrefService.init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Alaroos',
      theme: ThemeData(
        primaryColor: ColorRes.themeColor,
      ),
      debugShowCheckedModeBanner: false,
      home: const Splash_Screen(),
    );
  }
}
