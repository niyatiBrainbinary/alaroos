import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../../Common/toast.dart';
import '../../../../../Utils/api_res.dart';
import '../../../../../service/http_service.dart';
import 'category_model.dart';

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