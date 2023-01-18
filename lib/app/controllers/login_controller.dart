
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';
class LoginController extends GetxController {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  final RxBool isHide = false.obs;

  login() {
    if (formKey.currentState!.saveAndValidate()) {
      print(formKey.currentState!.value);
      Get.toNamed(AppRoutes.HOME);
    }
  }


}