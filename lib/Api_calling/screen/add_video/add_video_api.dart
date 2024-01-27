import 'dart:convert';
import 'dart:io';

import 'package:alaroos/Api_calling/screen/add_video/add_video_model.dart';
import 'package:alaroos/Utils/api_res.dart';
import 'package:alaroos/Utils/pref_key.dart';
import 'package:alaroos/service/pref_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AddVideoApi {
  static Future addVideoApi({required File file}) async {

    var headers = {
      'Authorization': 'Bearer ${PrefService.getString(PrefKeys.registerToken)}'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${EndPoints.mainBaseUrl}/upload-media'));
    request.files.add(await http.MultipartFile.fromPath('media', file.path,filename:file.path.split("/").last));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }

   /* var headers = {
      'Authorization':
          'Bearer ${PrefService.getString(PrefKeys.registerToken)}',
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${EndPoints.mainBaseUrl}/upload-media'));
    request.files.add(await http.MultipartFile.fromPath('media', file.path));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responded = await http.Response.fromStream(response);
      final decoded = jsonDecode(responded.body);
      debugPrint(decoded);
      return addVideoModelFromJson(responded.body);
    } else {
      return AddVideoModel();
    }
  }*/
}}
