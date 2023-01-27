
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get_storage/get_storage.dart';

import '../data/provider/repositories/auth_repo.dart';
import '../data/provider/repositories/register_repo.dart';
import '../data/provider/responses/login_response.dart';
import '../data/provider/responses/register_response.dart';
import '../routes/app_routes.dart';
import '../ui/theme/snackbar_ui.dart';

class RegisterProfilController extends GetxController {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  final RxBool isHide = false.obs;
  final RxBool isHide2 = false.obs;
  final AuthRepo authRepo = Get.find();
  final RegisterRepo registerRepo = Get.find();

  Future<void> register() async {
    //box.write('isLogin', true);

    formKey.currentState!.save();


    if (formKey.currentState!.validate()) {
      //isLoading.value = true;
      //SnackbarUi.info(formKey.currentState!.value);
      print(formKey.currentState!.value);
      dio.Response response = await this.registerRepo.register(data: formKey.currentState!.value);

      if (response.statusCode == 200) {

        //RegisterResponse registerResponse = RegisterResponse.fromJson(response.data);
        //this.registerRepo.sessionDataSave(registerResponse);

        //le connecter en même temps
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        this.authRepo.sessionTokenDataSave(loginResponse);
        //isLoading.value = true;
        SnackbarUi.success("Inscription effectué avec succès");

        //envoyer le token OTP

        Get.offAllNamed(AppRoutes.REGISTER_OTP);

      } else {
        SnackbarUi.error(response.data.toString());
        //isLoading.value = false;
      }


    } else {
      SnackbarUi.error("Veuillez renseigner correctement le formulaire");
    }
  }


}