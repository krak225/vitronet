
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../config/app_constants.dart';
import '../data/provider/repositories/auth_repo.dart';
import '../data/provider/repositories/register_repo.dart';
import '../data/provider/responses/login_response.dart';
import '../ui/theme/snackbar_ui.dart';

class RegisterProfilController extends GetxController {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  final RxBool isHide = false.obs;
  final RxBool isHide2 = false.obs;
  final AuthRepo authRepo = Get.find();
  final RegisterRepo registerRepo = Get.find();
  final RxBool isLoading = false.obs;
  final GetStorage _storage = GetStorage();

  Future<void> register() async {
    //box.write('isLogin', true);

    formKey.currentState!.save();


    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      //SnackbarUi.info(formKey.currentState!.value);
      //print(formKey.currentState!.value);

      var data = Map<String, dynamic>.from(formKey.currentState!.value);

      String profil_id = _storage.read(AppConstants.USER_PROFIL_ID).toString();
      String situation_id = _storage.read(AppConstants.USER_SITUATION_ID).toString();
      String document_path_cni = _storage.read(AppConstants.USER_CNI).toString();
      String document_path_dpc = _storage.read(AppConstants.USER_DPC).toString();
      String document_path_cv = _storage.read(AppConstants.USER_CV).toString();
      String document_path_att = _storage.read(AppConstants.USER_ATT).toString();

      data['profil_id'] = profil_id;
      data['situation_id'] = situation_id;

      if(document_path_cni != ''){
        data['cni'] = await dio.MultipartFile.fromFile(document_path_cni, filename: 'cni');
      }
      if(document_path_dpc != ''){
        data['dpc'] = await dio.MultipartFile.fromFile(document_path_dpc, filename: 'dpc');
      }
      if(document_path_cv != ''){
        data['cv'] = await dio.MultipartFile.fromFile(document_path_cv, filename: 'cv');
      }
      if(document_path_dpc != ''){
        data['att'] = await dio.MultipartFile.fromFile(document_path_att, filename: 'att');
      }

      var formData = dio.FormData.fromMap(data);

      dio.Response response = await this.registerRepo.register(data: formData);

      print(response.data.toString());

      if (response.statusCode == 200) {

        //RegisterResponse registerResponse = RegisterResponse.fromJson(response.data);
        //this.registerRepo.sessionDataSave(registerResponse);user123

        //le connecter en même temps
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        this.authRepo.sessionTokenDataSave(loginResponse);
        //isLoading.value = true;
        SnackbarUi.success("Inscription effectué avec succès");

        //envoyer le token OTP

        //Get.offAllNamed(AppRoutes.REGISTER_OTP, arguments:loginResponse.email);

      } else {
        SnackbarUi.error(response.data.toString());
        isLoading.value = false;
      }


    } else {
      SnackbarUi.error("Veuillez renseigner correctement le formulaire");
      isLoading.value = false;
    }
  }


}