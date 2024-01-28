import 'package:alaroos/Utils/pref_key.dart';
import 'package:alaroos/service/pref_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Common/text_style.dart';
import '../../../../Utils/assets_res.dart';
import '../../../../Utils/color_res.dart';
import '../../../../Utils/string.dart';

class Post_Screen extends StatefulWidget {
  List<Map<String, dynamic>>? images;
  int? index;
  String? fName,lName;

  Post_Screen({Key? key, this.images, this.index,this.fName,this.lName}) : super(key: key);

  @override
  State<Post_Screen> createState() => _Post_ScreenState();
}

class _Post_ScreenState extends State<Post_Screen> {
  ScrollController? scrollController = ScrollController();

  @override
  void initState() {
    scrollController =
        ScrollController(initialScrollOffset: widget.index! *  Get.height * 0.56,);
    super.initState();
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
              Strings.post,
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
                      Strings.username,
                      style: forgotPass,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.022,
              ),
              Container(
                height: Get.height * 0.350,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.images![ind]['url']),
                      fit: BoxFit.cover),
                ),
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
