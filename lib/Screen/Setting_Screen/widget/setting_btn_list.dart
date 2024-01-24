import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Common/text_style.dart';
import '../../../Utils/color_res.dart';

class Setting_Btn_List extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final BorderRadius? borderRadius;
  final Color? color;
  final IconData icon;
  const Setting_Btn_List({Key? key, required this.title, required this.onTap, this.borderRadius, this.color, required this.icon}) : super(key: key);

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
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: btnText,
              ),Icon(icon ),
            ],
          ),
        ),
      ),
    );
  }
}
