import 'package:alaroos/Api_calling/screen/add_post/add_post_model.dart';
import 'package:alaroos/Screen/Account_Screen/account_screen.dart';
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

  static Future addPostApi({title,description,id,url,type}) async {
     String typeD ='image';
     if(type=="video"){
       typeD = "videos";
     }
    // try{
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${PrefService.getString(PrefKeys.registerToken)}",
      };
      var request = http.Request('POST', Uri.parse('${EndPoints.mainBaseUrl}/api/businessuser/addpost/${PrefService.getString(PrefKeys.employeeIdBusiness)}'));
     request.body = json.encode({
       "title":title,
       "description": description,
       "images": {
         "public_id": id,
         "url": url,
         "resource_type": typeD
       }
     });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responded = await http.Response.fromStream(response);
       // print(await response.stream.bytesToString());
      //  Get.to(() => Account_Screen());
       return addPostModelFromJson(responded.body);
      }
      else {
      return AddPostModel();
    }

  // }


}}
