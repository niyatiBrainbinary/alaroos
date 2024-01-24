import 'package:alaroos/Screen/Home_Screen/Home_details/Reels_Screen/reels_screen.dart';
import 'package:alaroos/Utils/assets_res.dart';
import 'package:alaroos/Utils/color_res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Reels extends StatelessWidget {
  const Reels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: GridView.builder(
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 3,
      //     crossAxisSpacing: Get.height * 0.015,
      //     mainAxisSpacing: Get.height * 0.015,
      //     childAspectRatio: 6 / 9,
      //   ),
      //   itemBuilder: (context, index) {
      //     AssetsRes.imageUrls.map(_createGridTileWidget).toList();
      //   },
      // ),
      body: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 3,
        mainAxisSpacing: 3,
        childAspectRatio: 6 / 9,
        children: AssetsRes.imageUrls.map(_createGridTileWidget).toList(),
      ),
    );
  }

  Widget _createGridTileWidget(String url) => Builder(
        builder: (context) => GestureDetector(
          onTap: () {
            Get.to(
              () => Reels_Screen(),
            );
          },
          child: Container(
            height: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  url,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: const Align(
              alignment: Alignment.bottomLeft,
              child: Icon(
                CupertinoIcons.play,
                color: ColorRes.themeColor,
              ),
            ),
          ),
        ),
      );
}
