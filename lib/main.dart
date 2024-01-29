import 'dart:io';

import 'package:alaroos/Screen/Dashboard/Widgets/bottom_bar.dart';
import 'package:alaroos/Screen/Dashboard/dashboard.dart';
import 'package:alaroos/Screen/Splash/splash_screen.dart';
import 'package:alaroos/Utils/color_res.dart';
import 'package:alaroos/Utils/pref_key.dart';
import 'package:alaroos/service/pref_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Screen/Auth/Guest_Auth/reset_password/reset_password_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(Platform.isIOS) {
    await Firebase.initializeApp(options: const FirebaseOptions(apiKey: "AIzaSyD44YQfUOoFzxVSRvwdF7U8wypPoiMTK8Y",
        appId: "1:83573673094:ios:d78b7b7cce8571d7331507",
        messagingSenderId: "83573673094",
        projectId: "aiaroos"));
  }
  else
    {
      await Firebase.initializeApp(options: const FirebaseOptions(apiKey: "AIzaSyAbovX3kfvoOyjaBYRYfHbrdhr_cFftrKM",
          appId: "1:83573673094:android:daaa950e9b7d7a47331507",
          messagingSenderId: "83573673094",
          projectId: "aiaroos"));
    }
  await PrefService.init();
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
    //home:  ResetPasswordScreen(),
     home: PrefService.getBool(PrefKeys.login)==true ?BottomBar(): const Splash_Screen(),
    );
  }
}
