
import 'package:alaroos/Api_calling/screen/logout/logout_model.dart';
import 'package:http/http.dart' as http;

import '../../../Screen/Splash/splash_screen.dart';
import '../../../Utils/api_res.dart';

import 'dart:convert';

import 'package:alaroos/Api_calling/auth/business_register_api/category_api/category_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../Common/toast.dart';
import '../../../../service/http_service.dart';
import '../../../Utils/pref_key.dart';
import '../../../service/pref_service.dart';

/*
class LogoutApi {
  static Future logoutApi () async {
    String url = EndPoints.logout;
    http.Response? response = await HttpService.getApi(
        url: url,
        header: {
          'Authorization' :"Bearer ${PrefService.getString(PrefKeys.registerToken)}",
        }
    );
    final decoded = jsonDecode(response!.body);
    if(response.statusCode == 200){
      PrefService.clear();
      Get.to(() => Splash_Screen());
      print(decoded);
      return logoutModelFromJson(response.body);
    } else {
      errorToast(decoded["message"]);
      return LogoutModel();
    }
  }
}*/




/*
Future<void> logout() async {
  try {
    final response = await http.post(
      Uri.parse(logoutApiUrl),
      headers: {
        'Content-Type': 'application/json',
        // Add any additional headers as needed (e.g., authentication token)
      },
      // Add any request body parameters if required
    );

    if (response.statusCode == 200) {
      // Successfully logged out
      print('Logged out successfully');
      // Navigate to the login screen or any other desired screen
      // Example: Navigator.pushReplacementNamed(context, '/login');
    } else {
      // Handle the error
      print('Failed to log out. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle any exceptions
    print('Error: $e');
  }
}
*/
