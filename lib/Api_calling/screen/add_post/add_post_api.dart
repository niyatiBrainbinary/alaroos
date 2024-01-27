import 'package:alaroos/Api_calling/screen/add_post/add_post_model.dart';
import 'package:alaroos/Screen/Account_Screen/account_screen.dart';
import 'package:alaroos/Screen/Auth/Forgot_Password/ForgotPassword.dart';
import 'package:alaroos/Utils/pref_key.dart';
import 'package:alaroos/service/pref_service.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import '../../../Common/toast.dart';
import '../../../Screen/Home_Screen/Home_details/home_details.dart';
import '../../../Utils/api_res.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../../../Utils/string.dart';
import '../../../service/http_service.dart';










/*
class AddPostApi {
  static addPostApi({title,description,File? image}) async {
    final url = Uri.parse(EndPoints.post);
    var request = http.MultipartRequest('POST', url);

    request.headers.addAll({
      'Authorization': PrefService.getString(PrefKeys.registerToken),
    });

    request.fields.addAll({
      'title': title,
      'description': description,

      'image_id': PrefService.getString(PrefKeys.imageId),
      'image_url': PrefService.getString(PrefKeys.imageUrl),

     // 'measurments': jsonEncode(measurements),
     // 'measurment_date': date
    });


    if(image != null) {
      if (image.path.isNotEmpty) {
        var fileExtension = path.extension(image.path).toLowerCase();
        print('File Extension: ${fileExtension.substring(1)}');


        if (fileExtension == '.png' ||
            fileExtension == '.jpg' ||
            fileExtension == '.svg' ||
            fileExtension == '.jpeg' ||
            fileExtension == '.mp4' ||
            fileExtension == '.avi' ||
            fileExtension == '.webp') {
          request.files.add(
              await http.MultipartFile.fromPath('image', image.path,
                  contentType: MediaType("image", fileExtension.substring(1))));
        }
      }
    }


    try {
      var response = await request.send();

      if (response.statusCode == 200) {
        var responded = await http.Response.fromStream(response);
        final decoded = jsonDecode(responded.body);

        print(decoded);

        if (decoded["success"] == true) {
          showToast(decoded["message"]);
          return addPostModelFromJson(responded.body);

        } else {

          showToast(decoded["message"]);

        }
      }
      return AddPostModel();
    } catch (e) {
      print("==========>> $e");
      return AddPostModel();
    }
  }
}
*/


class AddPostApi {

  static Future addPostApi({title,description,image_id, image_url, video_id,video_url}) async {

    // try{
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${PrefService.getString(PrefKeys.registerToken)}",
        'Cookie': 'refreshToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1YjMyZjRlMTM2ZTdmNmJmMWVmNTVmNiIsImlhdCI6MTcwNjI0NzM5OCwiZXhwIjoxNzA2NTA2NTk4fQ.ilZtUCuWDOmGuSw7O_zDvj4fLjgO5PPDq3G2taNCbiU'
      };
      var request = http.Request('POST', Uri.parse('https://7a51-2405-201-2024-ad6b-34d7-c362-2d5-88cc.ngrok-free.app/api/businessuser/addpost/65b32f4e136e7f6bf1ef55f6'));
      request.body = json.encode({
        "title": title,
        "description": description,
        "images": [
          {
            "public_id": "w2lpcqgg39dkzzv5l1v1",
            "url": image_url
          },
        ],
        "videos": [
          {
            "public_id": "topjalkjkhrldd5u4fii",
            "url": "https://res.cloudinary.com/de21nmsb1/video/upload/v1706156545/topjalkjkhrldd5u4fii.mov"
          }
        ]
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responded = await http.Response.fromStream(response);
        final decoded = jsonDecode(responded.body);

        print(decoded);
       // print(await response.stream.bytesToString());
      //  Get.to(() => Account_Screen());
       return addPostModelFromJson(responded.body);
      }
      else {
      return AddPostModel();
    }

  // }


}}
