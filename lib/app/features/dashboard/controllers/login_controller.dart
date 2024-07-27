
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:hello_depart/app/config/routes/app_pages.dart';

import '../../../data/provider/repositories/auth_repo.dart';
import '../../../data/provider/responses/login_response.dart';
import '../../../utils/ui/theme/snackbar_ui.dart';

class LoginController extends GetxController {
  //GlobalKey<FormBuilderState> formKeyLogin = GlobalKey<FormBuilderState>();
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  final RxBool isHide = true.obs;
  final AuthRepo authRepo = Get.find();

  Future<void> login() async {
    //box.write('isLogin', true);
    //Get.offAllNamed(AppPages.initial);

    formKey.currentState!.save();
    print(formKey.currentState!.value);

    if (formKey.currentState!.validate()) {
      //isLoading.value = true;
      print(formKey.currentState!.value);

      dio.Response response = await this.authRepo.login(data: formKey.currentState!.value);
      //print(response.data);
      if (response.statusCode == 200) {

        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        this.authRepo.sessionTokenDataSave(loginResponse);
        //isLoading.value = true;
        //SnackbarUi.success("Connecté");

        Get.offAllNamed(AppPages.initial);

      } else {
        SnackbarUi.error("Login ou mot de passe erroné.");
        //SnackbarUi.error(response.data['message']);
        //isLoading.value = false;
      }


    } else {
      print("validation failed: ");
    }
  }




}