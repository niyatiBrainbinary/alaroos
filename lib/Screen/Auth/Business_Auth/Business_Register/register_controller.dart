import 'package:alaroos/Api_calling/auth/business_register_api/category_api/category_model.dart';
import 'package:alaroos/Screen/Home_Screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../Api_calling/auth/business_register_api/business_register_api.dart';
import '../../../../Api_calling/auth/business_register_api/category_api/category_api.dart';
import '../../../../Utils/string.dart';
import '../../../Category_select_Screen/category_screen.dart';
import '../../../Dashboard/Widgets/bottom_bar.dart';
import '../../../Dashboard/dashboard.dart';
import '../../../Select_Language/select_language.dart';

class BusinessRegisterController extends GetxController {
  final GlobalKey<FormState> signupForm = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController businessEmailController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  RxBool isLoading = false.obs;
  bool isClick = false;
  CategoryModel categoryModel = CategoryModel();
List<CategoryModel> categoryList = [];

String CategoryId = "";


  registerUser({password, firstName, lastName, mobile,businessname,category }) async {
    isLoading.value = true;
    await BusinessRegisterApi.businessRegisterApi(password: password, firstName: firstName, lastName: lastName, mobile: mobile, businessname: businessname,email: businessEmail, categoryId: CategoryId);
    isLoading.value = false;
  }


  category () async {
    isLoading.value = true;
    categoryModel = await CategoryApi.categoryApi();
   /* if (categoryModel.data != null && categoryModel.data!.isNotEmpty) {
      // Remove duplicates before adding new locations
      Set<String?> existingIds = categoryList.map((data) => data.title).toSet();
      List<CategoryModel> newCategory = categoryModel.data!
          .where((data) => !existingIds.contains(data.title))
          .toList();

      categoryList.addAll(newCategory);
      update(['business_register']);
    }*/

    isLoading.value = false;
  }

  String categoryError = "";
  List categoryData = [];

  String selectCategoryType = Strings.selectCategory;
  String categoryDrop = "";
  List categoryName = [
    "State 1",
    "State 2",
    "State 3",
  ];

  String userName = "";


  void setUserName(String value) {
    userName = value.trim();
  }

  validateUserName() {
    if (userNameController.text.trim() == "") {
      userName = Strings.usernameerrorMessage;
    } else {
      userName = "";
    }
    update(['business_register']);
  }

  String businessName = "";

  void setBusinessName(String value) {
    businessName = value.trim();
  }

  validateBusinessName() {
    if (businessNameController.text.trim() == "") {
      businessName = Strings.businessnameerrorMessage;
    } else {
      businessName = "";
    }
    update(['business_register']);
  }

  String businessEmail = "";

  void setEmail(String value) {
    businessEmail = value.trim();
  }

  validateEmail() {
    final emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$',
    );
    if (businessEmailController.text.trim() == "") {
      businessEmail = Strings.emailErrorRegister;
    } else if (!emailRegex.hasMatch(businessEmail)) {
      businessEmail = Strings.emailErrorRegister1;
    } else {
      businessEmail = "";
    }
    update(['business_register']);
  }

  String phoneNo = '';

  void setPhone(String value) {
    phoneNo = value.trim();
  }

  validatePhone() {
    if (phoneNoController.text.trim() == "") {
      phoneNo = Strings.phoneErrorMessage;
    } else if (phoneNo.length < 10) {
      phoneNo = Strings.phoneErrorMessage1;
    } else if (phoneNo.length > 10) {
      phoneNo = Strings.phoneErrorMessage1;
    } else {
      phoneNo = "";
    }
    update(['business_register']);
  }

  String password = '';

  void setPassword(String value) {
    password = value.trim();
  }

  validatePassword() {
    if (passwordController.text.trim() == "") {
      password = Strings.passwordErrorMessage;
    } else if (password.length < 8) {
      password = Strings.passwordErrorMessage1;
    } else {
      password = "";
    }
    update(['business_register']);
  }

  void setCategoryDrop(String value) {
    categoryDrop = value.trim();
  }

  bool validationSignup() {
    validateUserName();
    validateBusinessName();
   // validateEmail();
    //validatePhone();
   // validatePassword();

    if (userName == '' &&
        businessName == ''
      //  businessEmail == '' &&
      //  phoneNo == '' &&
      //  password == ''
    ) {
      return true;
    } else {
      return false;
    }
  }

  onTapSignUp() {
    if (validationSignup()) {
      Get.to(() => Select_Language());
    }
  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    await category();
  }
}
