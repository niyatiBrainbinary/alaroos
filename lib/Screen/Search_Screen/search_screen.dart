import 'package:alaroos/Common/text_style.dart';
import 'package:alaroos/Screen/Search_Screen/search_controller.dart';
import 'package:alaroos/Screen/Search_Screen/widget/search_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utils/assets_res.dart';
import '../../Utils/color_res.dart';
import '../../Utils/string.dart';

class Search_Screen extends StatelessWidget {
  const Search_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Search_Controller searchController = Get.put(Search_Controller());
    return Scaffold(
      body: GetBuilder<Search_Controller>(
        id: 'search',
        builder: (controller) {
          return controller.SearchController.text.trim() == ""
              ? Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextFormField(
                        onChanged: searchController.setSearch,
                        controller: searchController.SearchController,
                        decoration:  InputDecoration(
                            prefixIcon: const Icon(Icons.search_rounded),
                            filled: true,
                            fillColor: ColorRes.serchTextfiled,
                            border:
                                const OutlineInputBorder(borderSide: BorderSide.none),
                            hintText: Strings.search.tr),
                      ),
                    ),
                     Expanded(
                      child: Search_List(),
                    ),
                  ],
                )
              : Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: TextFormField(
                                onTap: () {
                                  searchController.setSearch;
                                },
                                controller: searchController.SearchController,
                                decoration:  InputDecoration(
                                    prefixIcon: const Icon(Icons.search_rounded),
                                    filled: true,
                                    fillColor: ColorRes.serchTextfiled,
                                    border: const OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    hintText: Strings.search.tr),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.01,
                          ),
                          GestureDetector(
                            onTap: () {
                              searchController.SearchController.clear();
                              searchController.update(['search']);
                            },
                            child:  Text(Strings.cancle.tr),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Strings.recent.tr,
                            style: homeTitle,
                          ),
                          Text(
                            Strings.seeAll.tr,
                            style: donthaveac,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    ListTile(
                      title: Text(
                        Strings.username.tr,
                        style: forgotPass,
                      ),
                      subtitle: Text(
                        Strings.trueline.tr,
                        style: donthaveac,
                      ),
                      leading: CircleAvatar(
                        radius: Get.height * 0.033,
                        foregroundImage: const AssetImage(AssetsRes.userImage),
                      ),
                      trailing: const Icon(Icons.close),
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    ListTile(
                      title: Text(
                        Strings.username2.tr,
                        style: forgotPass,
                      ),
                      subtitle: Text(
                        Strings.creativity.tr,
                        style: donthaveac,
                      ),
                      leading: CircleAvatar(
                        radius: Get.height * 0.033,
                        foregroundImage: const AssetImage(AssetsRes.userImage2),
                      ),
                      trailing: const Icon(Icons.close),
                    )
                  ],
                );
          // return searchController.SearchController.text != ""
          //     ? Column(
          //         children: [
          //           SizedBox(
          //             height: Get.height * 0.03,
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.all(20),
          //             child: TextFormField(
          //               controller: searchController.SearchController,
          //               decoration: const InputDecoration(
          //                   prefixIcon: Icon(Icons.search_rounded),
          //                   filled: true,
          //                   fillColor: ColorRes.serchTextfiled,
          //                   border:
          //                       OutlineInputBorder(borderSide: BorderSide.none),
          //                   hintText: Strings.search),
          //             ),
          //           ),
          //           Expanded(child: Search_List())
          //         ],
          //       )
          //     :
        },
      ),
    );
  }
}
