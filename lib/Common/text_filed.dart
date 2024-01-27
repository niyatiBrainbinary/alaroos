import 'package:alaroos/Common/text_style.dart';
import 'package:alaroos/Screen/Auth/Guest_Auth/Guest_login/gusest_login.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Screen/Auth/Business_Auth/Business_Register/register_controller.dart';
import '../Utils/color_res.dart';
import '../Utils/string.dart';

class CommonTextField extends StatelessWidget {
  final String? prefixText;
  final String title;

  final TextInputType keyboardType;
  final TextEditingController controller;
  final Function(String)? onChange;
  final bool? isObSecure;
  final TextInputType? textInputType;
  final bool? isPhone;
  final bool? isSuffixIcon;
  final bool? readOnly;
 // final bool? readOnly;
  final String? suffixIcon;
  final GestureTapCallback? suffixIconOnTap;
  final String? Function(String?)? validator;
  const CommonTextField({
    Key? key,
    required this.title,
    required this.controller,
    this.onChange,
    this.isObSecure,
    this.textInputType,
    this.isPhone,
    this.validator,
    this.prefixText,
    this.isSuffixIcon,
    this.suffixIcon, 
    required this.keyboardType, this.suffixIconOnTap, this.readOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //height: 50,
        width: double.infinity,
        child: TextFormField(
          readOnly: readOnly ?? false,
          controller: controller,
          obscureText: isObSecure ?? false,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            // enabledBorder: OutlineInputBorder(
            //   borderSide: BorderSide(color: Colors.red),
            // ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ColorRes.textfiledBorder),
            ),
            labelText: title,
            labelStyle: textfiledLable,
            prefixText: prefixText,
              suffixIcon: isSuffixIcon != null
                  ? isSuffixIcon == true
                  ? GestureDetector(
                  onTap: suffixIconOnTap,
                  child: Image.asset(
                    suffixIcon ?? "",
                    scale: 2.5,
                  )
              )
                  : SizedBox(): null,
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          onChanged: onChange,
          validator: validator,
        ),
      ),
    );
  }
}

class DropDownTextFled extends StatelessWidget {
  final String? hintText;
  final String title;
  final TextEditingController? controller;
  const DropDownTextFled(
      {Key? key, this.controller, this.hintText, required this.title})
      : super(key: key);


  @override
  Widget build(BuildContext context) {

    BusinessRegisterController businessRegisterController =
    Get.put(BusinessRegisterController());
    return Scaffold(
      body: DropDownTextField(
        //controller: controller,
        textFieldDecoration: InputDecoration(
          // enabledBorder: OutlineInputBorder(
          //   borderSide: BorderSide(color: ColorRes.textfiledBorder),
          // ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorRes.textfiledBorder),
          ),
          labelText: title,
          labelStyle: textfiledLable,
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        // initialValue: "name4",
        listSpace: 20,
        listPadding: ListPadding(top: 20),
        enableSearch: true,
        validator: (value) {
          if (value == null) {
            return "Required field";
          } else {
            return null;
          }
        },
        dropDownList: const [

          DropDownValueModel(name: Strings.wedding, value: "value1"),
          DropDownValueModel(name: Strings.photoStudio, value: "value2"),
          DropDownValueModel(name: Strings.event, value: "value3"),
          DropDownValueModel(name: Strings.flowerist, value: "value4"),
          DropDownValueModel(name: Strings.designer, value: "value5"),
          DropDownValueModel(name: Strings.chocoliast, value: "value6"),
          DropDownValueModel(name: Strings.bride, value: "value7"),
        ],

        dropDownItemCount: 7,

        onChanged: (val) async {
if(businessRegisterController.validation()){
 await businessRegisterController.category();
}
        },
      ),
    );
  }
}
