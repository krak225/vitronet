
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../data/provider/repositories/auth_repo.dart';
import '../data/provider/responses/login_response.dart';
import '../routes/app_routes.dart';
import '../ui/theme/snackbar_ui.dart';
class LoginController extends GetxController {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  final RxBool isHide = true.obs;
  final AuthRepo authRepo = Get.find();


  Future<void> login() async {
    //box.write('isLogin', true);
    //Get.offAllNamed(AppRoutes.HOME);
    formKey.currentState!.save();
    print(formKey.currentState!.value);

    if (formKey.currentState!.validate()) {
      //isLoading.value = true;
      print(formKey.currentState!.value);

      dio.Response response = await this.authRepo.login(data: formKey.currentState!.value);
      print("response.data");
      print(response);
      if (response.statusCode == 200) {

        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        this.authRepo.sessionTokenDataSave(loginResponse);
        //isLoading.value = true;
        //SnackbarUi.success("Connecté");

        Get.offAllNamed(AppRoutes.HOME);

      } else {
        SnackbarUi.error(response.data['message']);
        //isLoading.value = false;
      }


    } else {
      print("validation failed: ");
    }
  }




}