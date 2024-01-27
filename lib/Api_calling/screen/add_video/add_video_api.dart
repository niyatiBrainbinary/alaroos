import 'dart:convert';
import 'dart:io';

import 'package:alaroos/Api_calling/screen/add_video/add_video_model.dart';
import 'package:alaroos/Utils/api_res.dart';
import 'package:alaroos/Utils/pref_key.dart';
import 'package:alaroos/service/pref_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class AddVideoApi {
  static Future addVideoApi({required File file, String? type}) async {
    // try{
    var headers = {
      'Authorization':
          'Bearer ${PrefService.getString(PrefKeys.registerToken)}',
    };
    String name = file.path.split("/").last;
    var request = http.MultipartRequest(
        'POST', Uri.parse('${EndPoints.mainBaseUrl}/upload-media'));
    request.files.add(await http.MultipartFile.fromPath('media', file.path,
        filename: name, contentType: MediaType(type!, name.split(".").last)));


    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responded = await http.Response.fromStream(response);
      return addVideoModelFromJson(responded.body);
    } else {
      return AddVideoModel();
    }
  }
}
