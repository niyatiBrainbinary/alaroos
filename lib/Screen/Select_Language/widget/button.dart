import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Common/text_style.dart';
import '../../../Utils/color_res.dart';
import '../../../Utils/string.dart';
import '../language_controller.dart';

class Button extends StatelessWidget {
  Button({Key? key}) : super(key: key);
  final LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => GestureDetector(
            onTap: () {
              languageController.setLanguage("English");
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Container(
                height: Get.height * 0.08,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(8),
                  color: languageController.selectedLanguage == "English"
                      ? ColorRes.btnColor
                      : Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            Strings.english,
                            style: btnText,
                          ),
                        ),
                      ),
                      Obx(
                        () => languageController.selectedLanguage == "English"
                            ? Container(
                                height: 20,
                                width: 20,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorRes.textColor,
                                ),
                                child: const Center(
                                    child: Icon(Icons.check,
                                        color: ColorRes.themeColor, size: 16)),
                              )
                            : Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: ColorRes.textfiledBorder),
                                ),
                              ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: Get.height * 0.04,
        ),
        Obx(
          () => GestureDetector(
            onTap: () {
              languageController.setLanguage("Arabic");
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Container(
                height: Get.height * 0.08,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(8),
                  color: languageController.selectedLanguage == "Arabic"
                      ? ColorRes.btnColor
                      : Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            Strings.arabic,
                            style: btnText,
                          ),
                        ),
                      ),
                      Obx(
                        () => languageController.selectedLanguage == "Arabic"
                            ? Container(
                                height: 20,
                                width: 20,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorRes.textColor,
                                ),
                                child: const Center(
                                  child: Icon(Icons.check,
                                      color: ColorRes.themeColor, size: 16),
                                ),
                              )
                            : Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: ColorRes.textfiledBorder),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
