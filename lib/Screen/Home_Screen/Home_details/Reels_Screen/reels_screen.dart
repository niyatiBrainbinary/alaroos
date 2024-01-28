import 'package:alaroos/Utils/pref_key.dart';
import 'package:alaroos/service/pref_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../../Common/text_style.dart';
import '../../../../Utils/assets_res.dart';
import '../../../../Utils/color_res.dart';
import '../../../../Utils/string.dart';

class Reels_Screen extends StatefulWidget {
  List<Map<String, dynamic>>? images;
  int? index;
  String? fName, lName, nImage;
  List<VideoPlayerController>? videoController;

  Reels_Screen(
      {Key? key,
      this.lName,
      this.fName,
      this.index,
      this.images,
      this.videoController,
      this.nImage})
      : super(key: key);

  @override
  State<Reels_Screen> createState() => _Reels_ScreenState();
}

class _Reels_ScreenState extends State<Reels_Screen> {
  ScrollController scrollController = ScrollController();
  int? _currentlyPlayingIndex;

  @override
  void initState() {
    videoInitialize();
    scrollController = ScrollController(
      initialScrollOffset: widget.index! * Get.height * 0.56,
    );
    for (var controller in widget.videoController!) {
      controller.initialize().then((_) {
        setState(
            () {}); // Ensure the first frame is shown after the video is initialized
      });
      controller.addListener(() {
        if (controller.value.isPlaying &&
            _currentlyPlayingIndex !=
                widget.videoController!.indexOf(controller)) {
          // Pause the previously playing video
          widget.videoController![_currentlyPlayingIndex!].pause();
          setState(() {
            _currentlyPlayingIndex =
                widget.videoController!.indexOf(controller);
          });
        }
      });
    }
    super.initState();
  }

  videoInitialize() async {
    await Future.wait(
        widget.videoController!.map((controller) => controller.initialize()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(CupertinoIcons.back),
        ),
        shape: const Border(bottom: BorderSide(color: ColorRes.textColor)),
        backgroundColor: ColorRes.btnColor,
        toolbarHeight: Get.height * 0.13,
        title: Column(
          children: [
            Text(
              "${widget.fName} ${widget.lName}",
              style: forgotPass,
            ),
            Text(
              Strings.video,
              style: donthaveac,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          controller: scrollController,
          child: ListView.builder(
            itemCount: widget.images!.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, ind) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.026,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Container(
                          height:33,
                          width: 33,
                          decoration: const BoxDecoration(shape: BoxShape.circle),
                          child: PrefService.getString(PrefKeys.userImage).isEmpty
                              ? Image.asset(AssetsRes.userImage2)
                              : ClipRRect(
                              borderRadius: BorderRadius.circular(88.85),
                              child: Image.network(
                                PrefService.getString(PrefKeys.userImage),
                                fit: BoxFit.cover,
                              )),
                        ),
                        SizedBox(
                          width: Get.width * 0.020,
                        ),
                        Text(
                          "${widget.fName} ${widget.lName}",
                          style: forgotPass,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.022,
                  ),
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Center(
                        child: SizedBox(
                          height: Get.height * 0.350,
                          width: double.infinity,
                          child: AspectRatio(
                            aspectRatio:
                                widget.videoController![ind].value.aspectRatio,
                            child: VideoPlayer(
                              widget.videoController![ind],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Pause the currently playing video if any
                          if (_currentlyPlayingIndex != null &&
                              _currentlyPlayingIndex != ind) {
                            widget.videoController![_currentlyPlayingIndex!]
                                .pause();
                          }

                          // Toggle play/pause for the tapped video
                          widget.videoController![ind].value.isPlaying
                              ? widget.videoController![ind].pause()
                              : widget.videoController![ind].play();

                          setState(() {
                            _currentlyPlayingIndex = ind;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: widget.videoController![ind].value.isPlaying
                              ? const Icon(
                                  Icons.pause,
                                  size: 20,
                                  color: Colors.white,
                                )
                              : Image.asset(
                                  AssetsRes.playSvgrepo,
                                  height: 20,
                                  width: 20,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.012,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          widget.images?[ind]['title'] ?? "",
                          style: register,
                        ),
                        SizedBox(
                          height: Get.height * 0.05,
                          width: Get.width * 0.45,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              widget.images?[ind]['des'] ?? "",
                              textAlign: TextAlign.center,
                              style: subTitleStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.008,
                  ),
                ],
              );
            },
          )),
    );
  }
}
