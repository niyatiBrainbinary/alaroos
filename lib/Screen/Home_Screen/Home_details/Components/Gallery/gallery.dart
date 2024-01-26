import 'dart:io';

import 'package:alaroos/Api_calling/screen/add_post/add_post_model.dart';
import 'package:alaroos/Screen/Home_Screen/Add_New_Post/add_new_post_controller.dart';
import 'package:alaroos/Screen/Home_Screen/Home_details/Post_Screen/post_screen.dart';
import 'package:alaroos/Utils/assets_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Gallery extends StatelessWidget {
   Gallery({Key? key}) : super(key: key);
   AddNewPostController addNewPostController = Get.put(AddNewPostController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
      itemCount: addNewPostController.addPostModel.data!.images!.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
      itemBuilder: (context, index) {
        return Container(
          height: 80,
          width: 80,
         // color: Colors.grey,
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(addNewPostController.addPostModel.data?.images?[index].url ?? ""))
          ),
        );
      },
    )
        /*  GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 3,
        mainAxisSpacing: 3,
        childAspectRatio: 1.0,
        children:
        AssetsRes.imageUrls.map(_createGridTileWidget).toList(),
      ),*/
        );
  }

/*  Widget _createGridTileWidget(String url) => Builder(
        builder: (context) => GestureDetector(
          onTap: () {
            Get.to(
              () => Post_Screen(),
            );
          },
          child: Image.asset(url, fit: BoxFit.cover),
        ),
      );*/
}
