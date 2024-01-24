import 'package:alaroos/Utils/api_res.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../Common/toast.dart';
import '../../../Utils/string.dart';
import '../../../service/http_service.dart';
import 'Business_login_model/business_login_model.dart';

class LoginApi {

  static Future loginApi({required String email, required String password, required String userType}) async {


    try{
      String url = "${BussinessUser.businessLogin}?email=$email&password=$password&userTypes=$userType";

      http.Response? response = await HttpService.postApi(url: url);

      if (response != null && response.statusCode == 200) {

        return (userType == "consumer")
            ? businessLoginModelFromJson(response.body)
            : (userType == "Staff");
            // ?  loginStaffModelFromJson(response.body)
            // : loginMerchantModelFromJson(response.body);
      } else {
        errorToast(Strings.userNotFound);
      }
    } catch (e){
      errorToast(Strings.somethingWentWrong);
    }



  }


}