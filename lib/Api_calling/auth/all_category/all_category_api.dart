import 'dart:convert';

import 'package:alaroos/Api_calling/auth/all_category/all_category_model.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import '../../../../Utils/api_res.dart';
import '../../../../Utils/pref_key.dart';
import '../../../../service/http_service.dart';
import 'package:http/http.dart' as http;
import '../../../Common/toast.dart';
import '../business_register_api/category_api/category_model.dart';


class AllCategoryApi {
  static Future allCategoryApi () async {
    String url = EndPoints.allCategory;
    http.Response? response = await HttpService.getApi(
        url: url,
        header: {
          'Authorization' : 'Bearer',
        }
    );
    final decoded = jsonDecode(response!.body);
    if(response.statusCode == 200){
      print(decoded);
      return allCategoryModelFromJson(response.body);
    } else {
      errorToast(decoded["message"]);
      return AllCategoryModel();
    }
  }
}