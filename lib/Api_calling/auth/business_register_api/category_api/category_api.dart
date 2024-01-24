import 'dart:convert';

import 'package:alaroos/Api_calling/auth/business_register_api/category_api/category_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../Common/toast.dart';
import '../../../../Utils/api_res.dart';
import '../../../../Utils/pref_key.dart';
import '../../../../service/http_service.dart';
import '../../../../service/pref_service.dart';

class CategoryApi {
  static Future categoryApi () async {
    String url = EndPoints.category;
    http.Response? response = await HttpService.getApi(
        url: url,
        header: {
          'Authorization' : 'Bearer',
        }
    );
    final decoded = jsonDecode(response!.body);
    if(response.statusCode == 200){
      print(decoded);
      return categoryModelFromJson(response.body);
    } else {
      errorToast(decoded["message"]);
      return CategoryModel();
    }
  }
}