import 'package:alaroos/Common/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Utils/color_res.dart';
import '../Utils/string.dart';

class CommonBtn extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final BorderRadius? borderRadius;
  final Color? color;
  const CommonBtn(
      {Key? key,
      required this.onTap,
      this.borderRadius,
      this.color,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Get.height * 0.08,
        width: double.infinity,
        decoration: ShapeDecoration(
          color: ColorRes.btnColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          shadows: [
            BoxShadow(
              color: ColorRes.shadowColor.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: btnText,
          ),
        ),
      ),
    );
  }
}
