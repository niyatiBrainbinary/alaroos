import 'package:alaroos/Common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/assets_res.dart';
import '../../../Utils/string.dart';

class Search_List extends StatelessWidget {
  const Search_List({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: Get.height * 0.2,
                  width: Get.width * 0.42,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AssetsRes.photoStudio),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        Strings.photoStudio,
                        style: searchStyle,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: Get.height * 0.2,
                  width: Get.width * 0.42,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AssetsRes.eventPlanner),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        Strings.event,
                        style: searchStyle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: Get.height * 0.2,
                  width: Get.width * 0.42,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AssetsRes.weddingVenue),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        Strings.wedding,
                        style: searchStyle,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: Get.height * 0.2,
                  width: Get.width * 0.42,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AssetsRes.flowerist),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        Strings.flowerist,
                        style: searchStyle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: Get.height * 0.2,
                  width: Get.width * 0.42,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AssetsRes.chocolatier),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        Strings.chocoliast,
                        style: searchStyle,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: Get.height * 0.2,
                  width: Get.width * 0.42,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AssetsRes.bridesmide),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        Strings.bride,
                        style: searchStyle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: Get.height * 0.2,
                  width: Get.width * 0.42,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AssetsRes.decorationPlanner),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        Strings.decoration,
                        style: searchStyle,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: Get.height * 0.2,
                  width: Get.width * 0.42,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AssetsRes.designer),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        Strings.designer,
                        style: searchStyle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.1,
            ),
          ],
        ),
      ),
    )
        // body: Padding(
        //   padding: const EdgeInsets.only(left: 20, right: 20),
        //   child: GridView.count(
        //     crossAxisCount: 2,
        //     crossAxisSpacing: 20,
        //     mainAxisSpacing: 20,
        //     childAspectRatio: 1.0,
        //     children: AssetsRes.searchUrls.map(_createGridTileWidget).toList(),
        //   ),
        // ),
        );
  }

  Widget _createGridTileWidget(String url) => Builder(
        builder: (context) => GestureDetector(
          child: Image.asset(url, fit: BoxFit.cover),
        ),
      );
}
