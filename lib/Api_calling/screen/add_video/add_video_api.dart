import 'dart:convert';
import 'dart:io';

import 'package:alaroos/Api_calling/screen/add_video/add_video_model.dart';
import 'package:http/http.dart' as http;


class AddVideoApi {

  static Future addVideoApi({required File file}) async {

    // try{
    var headers = {
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1YjMyZjRlMTM2ZTdmNmJmMWVmNTVmNiIsImlhdCI6MTcwNjI0OTAxNywiZXhwIjoxNzA2MzM1NDE3fQ.YBlrZPfKctInIcR7QUGaBDBEkLYUqoX3WP8Ei-jtGpo',
      'Cookie': 'refreshToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1YjMyZjRlMTM2ZTdmNmJmMWVmNTVmNiIsImlhdCI6MTcwNjI0OTAxNywiZXhwIjoxNzA2NTA4MjE3fQ.AzOybJgbjtCJUB_AcJI0qV83WRSJFxemVnhIG6VqHAk'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://7a51-2405-201-2024-ad6b-34d7-c362-2d5-88cc.ngrok-free.app/upload-media'));
    request.files.add(await http.MultipartFile.fromPath('media',file.path,filename: file.path.split("/").last));
    // request.files.add(await http.MultipartFile.fromPath('media', '/C:/Users/Braibinary Infotech/Downloads/qjhep2ktjhoemu68ovsi (1).mov'));
    // request.files.add(await http.MultipartFile.fromPath('media', '/C:/Users/admin/Downloads/flower.jpg'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responded = await http.Response.fromStream(response);
      final decoded = jsonDecode(responded.body);

      print(decoded);
      // print(await response.stream.bytesToString());
      //  Get.to(() => Account_Screen());
      return addVideoModelFromJson(responded.body);
    }
    else {
      return AddVideoModel();
    }

    // }


  }}
