
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../data/provider/repositories/auth_repo.dart';
import '../data/provider/repositories/register_repo.dart';
import '../data/provider/responses/login_response.dart';
import '../ui/theme/snackbar_ui.dart';
class ProfilUpdateController extends GetxController {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  final RxBool isHide = false.obs;
  final RxBool isHide2 = false.obs;
  final AuthRepo authRepo = Get.find();
  final RegisterRepo registerRepo = Get.find();

  Future<void> update_profile() async {
    //box.write('isLogin', true);
    //print(" update_profile IS CALLED ");

    formKey.currentState!.save();


    if (formKey.currentState!.validate()) {
      //isLoading.value = true;
      //SnackbarUi.info(formKey.currentState!.value);
      print(formKey.currentState!.value);
      dio.Response response = await this.registerRepo.update_profile(data: formKey.currentState!.value);

      if (response.statusCode == 200) {

        //RegisterResponse registerResponse = RegisterResponse.fromJson(response.data);
        //this.registerRepo.sessionDataSave(registerResponse);

        //le connecter en même temps
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        this.authRepo.sessionTokenDataSave(loginResponse);
        //isLoading.value = true;
        SnackbarUi.success("Profil mise à jour avec succès");

      } else {
        SnackbarUi.error(response.data.toString());
        //isLoading.value = false;
      }


    } else {
      SnackbarUi.error("Veuillez renseigner correctement le formulaire");
    }
  }

}