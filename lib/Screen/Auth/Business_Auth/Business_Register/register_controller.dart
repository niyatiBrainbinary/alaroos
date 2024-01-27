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
    debugPrint("catmodel ------- ${categoryModel.data}");
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


  String userName = "";
  String businessName = "";
  String businessEmail = "";
  String phoneNo = '';
  String password = '';

  String userNameError = "";
  String businessNameError = "";
  String emailError = "";
  String phoneError = "";
  String passwordError = "";


 /* void setUserName(String value) {
    userName = value.trim();
  }*/

  userNameValidation() {
    if (userNameController.text.trim() == "") {
      userNameError = Strings.usernameerrorMessage;
    } else {
      userNameError = "";
    }
    update(['business_register']);
  }



/*  void setBusinessName(String value) {
    businessName = value.trim();
  }*/

  businessNameValidation() {
    if (businessNameController.text.trim() == "") {
      businessNameError = Strings.businessnameerrorMessage;
    } else {
      businessNameError = "";
    }
    update(['business_register']);
  }


/*
  void setEmail(String value) {
    businessEmail = value.trim();
  }*/

/*  validateEmail() {
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
  }*/

  emailValidation() {
    update(['business_register']);
    if (businessEmailController.text.trim() == "") {
      // errorToast(StringRes.enterEmailError.tr);
      emailError = Strings.emailErrorRegister.tr;
      update(['business_register']);
      return false;
    } else {
      if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(businessEmailController.text)) {
        emailError = '';
        update(['business_register']);
        return true;
      } else {
        // errorToast(StringRes.enterValidEmail.tr);
        emailError = Strings.emailError1.tr;
        update(['business_register']);
        return false;
      }
    }
  }



 /* void setPhone(String value) {
    phoneNo = value.trim();
  }*/

  phoneValidation() {
    if (phoneNoController.text.trim() == "") {
      phoneError = Strings.phoneErrorMessage;
    } else if (phoneNo.length < 10) {
      phoneError = Strings.phoneErrorMessage1;
    } else if (phoneNo.length > 10) {
      phoneError = Strings.phoneErrorMessage1;
    } else {
      phoneError = "";
    }
    update(['business_register']);
  }


/*
  void setPassword(String value) {
    password = value.trim();
  }*/



  passwordValidation() {
    if (passwordController.text.trim() == "") {
      passwordError = Strings.passwordErrorMessage;
    } else if (password.length < 8) {
      passwordError = Strings.passwordErrorMessage1;
    } else {
      passwordError = "";
    }
    update(['business_register']);
  }

   val() async {
    userNameValidation();
    businessNameValidation();
    emailValidation();
    phoneValidation();
    passwordValidation();
  }

  validation (){
    val();
    if (userName == '' &&
        businessName == ''
        && businessEmail == '' && phoneNo == '' && password == ''){
      return true;
    } else {
      return false;
    }
  }

/*  onTapSignUp() {
    if (validationSignup()) {
      Get.to(() => Select_Language());
    }
  }*/

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    //await category();
  }
}
