import 'package:alaroos/Common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/assets_res.dart';
import '../../../Utils/string.dart';
import '../../Select_Language/language_controller.dart';

class Search_List extends StatelessWidget {
  Search_List({Key? key}) : super(key: key);
  final LanguageController languageController = Get.put(LanguageController());

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
                        alignment:
                            languageController.selectedLanguage == "English"
                                ? Alignment.bottomLeft
                                : Alignment.bottomRight,
                        child: Text(
                          Strings.photoStudio.tr,
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
                        alignment:
                            languageController.selectedLanguage == "English"
                                ? Alignment.bottomLeft
                                : Alignment.bottomRight,
                        child: Text(
                          Strings.event.tr,
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
                        alignment:
                            languageController.selectedLanguage == "English"
                                ? Alignment.bottomLeft
                                : Alignment.bottomRight,
                        child: Text(
                          Strings.wedding.tr,
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
                        alignment:
                            languageController.selectedLanguage == "English"
                                ? Alignment.bottomLeft
                                : Alignment.bottomRight,
                        child: Text(
                          Strings.flowerist.tr,
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
                        alignment:
                            languageController.selectedLanguage == "English"
                                ? Alignment.bottomLeft
                                : Alignment.bottomRight,
                        child: Text(
                          Strings.chocoliast.tr,
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
                        alignment:
                            languageController.selectedLanguage == "English"
                                ? Alignment.bottomLeft
                                : Alignment.bottomRight,
                        child: Text(
                          Strings.bride.tr,
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
                        alignment:
                            languageController.selectedLanguage == "English"
                                ? Alignment.bottomLeft
                                : Alignment.bottomRight,
                        child: Text(
                          Strings.decoration.tr,
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
                        alignment:
                            languageController.selectedLanguage == "English"
                                ? Alignment.bottomLeft
                                : Alignment.bottomRight,
                        child: Text(
                          Strings.designer.tr,
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
      ),
    );
  }
}
