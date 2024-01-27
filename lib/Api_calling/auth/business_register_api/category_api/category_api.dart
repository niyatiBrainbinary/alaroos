import 'dart:convert';

import 'package:alaroos/Api_calling/auth/business_register_api/category_api/category_model.dart';
import 'package:http/http.dart' as http;

import '../../../../Common/toast.dart';
import '../../../../Utils/api_res.dart';
import '../../../../service/http_service.dart';

class CategoryApi {
  static Future categoryApi () async {
    String url = EndPoints.category;
    http.Response? response = await HttpService.getApi(url: url);

    if (response!.statusCode == 200) {
      return categoryModelFromJson(response.body);
    } else {
      errorToast(jsonDecode(response.body)["message"]);
      return CategoryModel();
    }
  }
}