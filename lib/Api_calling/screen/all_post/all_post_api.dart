import 'dart:convert';

import 'package:alaroos/Api_calling/auth/all_category/all_category_model.dart';
import 'package:alaroos/Api_calling/screen/all_post/all_post_model.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import '../../../../Utils/api_res.dart';
import '../../../../Utils/pref_key.dart';
import '../../../../service/http_service.dart';
import 'package:http/http.dart' as http;
import '../../../Common/toast.dart';


class AllPostApi {
  static Future allPostApi () async {
    String url = EndPoints.allPost;
    http.Response? response = await HttpService.getApi(
        url: url,
        header: {}
    );
    //final decoded = jsonDecode(response!.body);
    if(response!.statusCode == 200){
   //   print(decoded);
      return allPostModelFromJson(response.body);
    } else {
     // errorToast(decoded["message"]);
      return AllPostModel();
    }
  }
}