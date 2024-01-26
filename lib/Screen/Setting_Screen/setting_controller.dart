import 'package:alaroos/Api_calling/screen/logout/logout_api.dart';
import 'package:alaroos/Api_calling/screen/logout/logout_model.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  LogoutModel logoutModel = LogoutModel();
  RxBool isLoading = false.obs;



 /* logout () async {
    isLoading.value = true;
    logoutModel = await LogoutApi.logoutApi();
    isLoading.value = false;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    logout();
    super.onInit();
  }*/
}