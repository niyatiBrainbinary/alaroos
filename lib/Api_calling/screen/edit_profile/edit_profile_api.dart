import 'dart:convert';

import 'package:alaroos/Api_calling/screen/edit_profile/edit_profile_model.dart';
import 'package:alaroos/Screen/Account_Screen/Profile_Screen/profile_screen_controller.dart';
import 'package:get/get.dart';

import '../../../Common/toast.dart';
import '../../../Utils/api_res.dart';
import '../../../Utils/pref_key.dart';
import '../../../Utils/string.dart';
import '../../../service/http_service.dart';
import '../../../service/pref_service.dart';

class EditProfileApi {
  static editProfileApi({ firstName, lastName, businessname,  phone,  email,  profileimage}) async {
    try {
      var headers = {
        // 'Content-Type': 'application/json',
         'Authorization': "Bearer ${PrefService.getString(PrefKeys.registerToken)}",
        // 'Cookie': 'refreshToken=${PrefService.getString(PrefKeys.registerToken)}'
      };
      https://fbe4-2405-201-2024-ad6b-29-13e8-81f1-f63b.ngrok-free.app/api/businessuser/update-user/65b0d258373fa0ff2bfccd8e
      https://fbe4-2405-201-2024-ad6b-29-13e8-81f1-f63b.ngrok-free.app/api/businessuser/update-user/65b0a691fff4f7c082dd1492
      https://fbe4-2405-201-2024-ad6b-29-13e8-81f1-f63b.ngrok-free.app/api/businessuser/update-user/65b2415eab26d0a50d51ad29
      var response = await HttpService.putApi(
        url: "${EndPoints.editProfile}/${PrefService.getString(PrefKeys.employeeId)}",
        body: {

          "firstname": firstName,
          "lastname" : lastName,
          "businessname" : businessname,
          "email": email,
          "phone": phone,
          "password": "userb1203",
         "profileimage": "https://res.cloudinary.com/de21nmsb1/image/upload/v1706070030/ouvv7cnltnhtsipqxbr7.jpg"
        },
       header: headers,
      );

      if (response?.statusCode == 200) {
        var decoded = jsonDecode(response!.body);

        print(decoded);
        ProfileScreenController pr = Get.put(ProfileScreenController());
        pr.editNameController.text = decoded["data"]["firstname"];
        pr.editBusinessNameController.text = decoded["data"]["lastname"];
        pr.editEmailController.text = decoded["data"]["email"];
        pr.editPhoneNoController.text = decoded["data"]["phone"];
        // PrefService.setValue(PrefKeys.firstName, decoded["data"]["firstname"]);
        if (decoded["success"] == true) {
          Get.back();
        //  flutterToast(decoded["message"]);
          return editProfileModelFromJson(response.body);
        }
      } else {
        // Handle other status codes if needed
        print("HTTP Status Code: ${response?.statusCode}");
      }
      return EditProfileModel();
    } catch (e) {
      print("Error: $e");
      return EditProfileModel();
    }
  }
}
