import 'package:alaroos/Common/text_style.dart';
import 'package:alaroos/Screen/Home_Screen/Add_New_Post/add_new_post_controller.dart';
import 'package:alaroos/Screen/Home_Screen/Home_details/Reels_Screen/reels_screen.dart';
import 'package:alaroos/Utils/assets_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class Reels extends StatelessWidget {
  const Reels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddNewPostController addNewPostController = Get.put(AddNewPostController());

    return Scaffold(
        body: GetBuilder<AddNewPostController>(
      id: "post",
      builder: (controller) {
        return controller.videos.isEmpty
            ? Center(
                child: Text(
                  "No Reels Available",
                  style: textfiledLable,
                ),
              )
            : GridView.builder(
                itemCount: controller.videos.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to( Reels_Screen(
                        images: controller.videos,
                        index: index,
                        fName: controller.getAllPostModel.data!.firstname,
                        lName: controller.getAllPostModel.data!.lastname,
                        videoController:  controller.videoController,
                      ));
                    },
                    child: SizedBox(
                      height: 80,
                      width: 80,
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          AspectRatio(
                            aspectRatio: controller
                                .videoController[index]
                                .value
                                .aspectRatio,
                            child: VideoPlayer(
                              controller.videoController[index],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              AssetsRes.play,
                              height: 13.33,
                              width: 12.67,
                              fit: BoxFit.cover,
                            ),
                          )
                          /*  GestureDetector(
                              onTap: () {

                                */ /*controller
                                        .videoController[controller.currentIndex!]
                                        .value
                                        .isPlaying
                                    ? controller
                                        .videoController[controller.currentIndex!]
                                        .pause()
                                    : controller
                                        .videoController[controller.currentIndex!]
                                        .play();*/ /*
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(AssetsRes.play,height: 13.33,width: 12.67,fit: BoxFit.cover,),
                              )
                          )*/
                        ],
                      ),
                    ),
                  );
                },
              );
      },
    ));
  }
}
