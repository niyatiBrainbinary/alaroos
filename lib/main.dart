import 'package:alaroos/Screen/Splash/splash_screen.dart';
import 'package:alaroos/Utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
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
