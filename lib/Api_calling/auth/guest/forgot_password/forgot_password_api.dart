import 'dart:convert';

import 'package:alaroos/service/http_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../Screen/Select_Language/select_language.dart';

class ForgotPasswordApi {
  static Future  forgotPasswordApi({ required String email}) async{
    final apiUrl = 'https://e2da-2405-201-2024-ad6b-59a2-389b-7a04-167f.ngrok-free.app/api/user/forgot-password';

    try {
      http.Response? response = await HttpService.postApi(url: apiUrl,
      body: {
        "email": email
      }
      );
      if(response!.statusCode == 200) {
        var decoded = jsonDecode(response.body);
        debugPrint('===========$decoded');
        Get.to(()=> Select_Language());
      }
    } catch (e) {
      // Handle network or other errors
      print('Error: $e');
    }
  }
}