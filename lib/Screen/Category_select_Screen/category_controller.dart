import 'package:alaroos/Api_calling/auth/all_category/all_category_model.dart';
import 'package:get/get.dart';

import '../../Api_calling/auth/all_category/all_category_api.dart';
import '../../Api_calling/auth/business_register_api/category_api/category_api.dart';

class CategoryController extends GetxController{
  AllCategoryModel allCategoryModel = AllCategoryModel();
  RxBool isLoading = false.obs;



  allCategory () async {
    isLoading.value = true;
    allCategoryModel = await AllCategoryApi.allCategoryApi();


    isLoading.value = false;
  }

  @override
  void  onInit() async {
    // TODO: implement onInit
    super.onInit();
    await allCategory();
  }
}