import 'dart:convert';

import 'package:alaroos/Api_calling/screen/get_all_post/get_all_post_model.dart';
import 'package:alaroos/Common/toast.dart';
import 'package:alaroos/Utils/api_res.dart';
import 'package:alaroos/Utils/pref_key.dart';
import 'package:alaroos/service/http_service.dart';
import 'package:alaroos/service/pref_service.dart';
import 'package:http/http.dart' as http;
class GetAllPostApi {
  static Future getAllPostApi () async {
    String url = EndPoints.getAllPost;
    http.Response? response = await HttpService.getApi(
        url: url,
        header: {
          'Authorization' :"Bearer ${PrefService.getString(PrefKeys.registerToken)}",
        }
    );
    if(response!.statusCode == 200){

      return getAllPostModelFromJson(response.body);
    } else {
      return GetAllPostModel();
    }
  }
}