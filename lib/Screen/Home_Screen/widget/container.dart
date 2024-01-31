import 'package:alaroos/Common/common_btn.dart';
import 'package:alaroos/Common/loader.dart';
import 'package:alaroos/Common/text_style.dart';
import 'package:alaroos/Screen/Account_Screen/account_screen.dart';
import 'package:alaroos/Screen/Home_Screen/Home_details/home_details.dart';
import 'package:alaroos/Screen/Home_Screen/home_controller.dart';
import 'package:alaroos/Utils/assets_res.dart';
import 'package:alaroos/Utils/color_res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/string.dart';

class Container_Screen extends StatelessWidget {
   Container_Screen({Key? key}) : super(key: key);

   final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: Get.height,
            width: Get.width,
            //  height: 400, width: 300,
              child: ListView.builder(
                itemCount:3,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /*Container(
                        height: Get.height * 0.300,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage(AssetsRes.down), fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.046,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(
                                () => const Home_Details_Screen(),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: Get.height * 0.033,
                                foregroundImage: const AssetImage(AssetsRes.userImage),
                              ),
                              SizedBox(
                                width: Get.width * 0.020,
                              ),
                              Text(
                                Strings.username,
                                style: forgotPass,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.022,
                      ),*/
                      Container(
                        height: Get.height * 0.350,
                        width: double.infinity,
                        decoration:  BoxDecoration(
                          image: DecorationImage(image: 
                         // NetworkImage(homeController.allPostModel.data![index].images![index].name.toString()),
                          AssetImage(
                            //homeController.allPostModel0.data[index].images,
                              AssetsRes.image1
                          ),
                            fit: BoxFit.cover),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
              homeController.allPostModel.data?[index].title ?? "",
                              //Strings.title,
                              style: register,
                            ),
                            Container(
                              height: Get.height * 0.05,
                              width: Get.width * 0.45,
                              decoration: const BoxDecoration(),
                              child: Text(
                                homeController.allPostModel.data?[index].description ?? "",
                               // Strings.subtitle,
                                textAlign: TextAlign.center,
                                style: subTitleStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.046,
                      ),
                      /*GestureDetector(
                        onTap: () => Get.to(() => const Account_Screen()),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: Get.height * 0.033,
                                foregroundImage: const AssetImage(AssetsRes.userImage2),
                              ),
                              SizedBox(
                                width: Get.width * 0.020,
                              ),
                              Text(
                                Strings.username2,
                                style: forgotPass,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.022,
                      ),
                      Container(
                        height: Get.height * 0.350,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage(AssetsRes.image2), fit: BoxFit.cover),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                Strings.title2,
                                style: register
                            ),
                            Container(
                              height: Get.height * 0.05,
                              width: Get.width * 0.45,
                              decoration: const BoxDecoration(),
                              child: Text(
                                Strings.subtitle,
                                textAlign: TextAlign.center,
                                style: subTitleStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.1,
                      ),*/
                    ],
                  );
                },
              
              ),
            ),
          ),
          
          Obx(() => homeController.isLoading.value ? Loader() : SizedBox())
        ],
      ),
    );
  }
}
