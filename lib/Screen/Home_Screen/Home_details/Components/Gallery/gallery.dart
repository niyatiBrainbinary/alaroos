import 'package:alaroos/Screen/Home_Screen/Home_details/Post_Screen/post_screen.dart';
import 'package:alaroos/Utils/assets_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Gallery extends StatelessWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 3,
        mainAxisSpacing: 3,
        childAspectRatio: 1.0,
        children: AssetsRes.imageUrls.map(_createGridTileWidget).toList(),
      ),
    );
  }

  Widget _createGridTileWidget(String url) => Builder(
        builder: (context) => GestureDetector(
          onTap: () {
            Get.to(
              () => Post_Screen(),
            );
          },
          child: Image.asset(url, fit: BoxFit.cover),
        ),
      );
}
