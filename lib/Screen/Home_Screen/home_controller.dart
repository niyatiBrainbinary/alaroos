import 'package:alaroos/Api_calling/screen/add_post/add_post_model.dart';
import 'package:alaroos/Api_calling/screen/all_post/all_post_api.dart';
import 'package:alaroos/Api_calling/screen/all_post/all_post_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  AllPostModel allPostModel = AllPostModel();
  RxBool isLoading = false.obs;



  allPost () async {
    isLoading.value = true;
    allPostModel = await AllPostApi.allPostApi();
    isLoading.value = false;
  }

  @override
  void  onInit() async {
    await allPost();
    // TODO: implement onInit
    super.onInit();

  }
}
