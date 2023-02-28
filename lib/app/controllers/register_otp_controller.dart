import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../config/app_constants.dart';
import '../data/provider/repositories/register_repo.dart';
import '../routes/app_routes.dart';
import '../ui/theme/snackbar_ui.dart';

class RegisterOtpController extends GetxController {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  final RegisterRepo registerRepo = Get.find();
  final GetStorage _storage = GetStorage();

  Future<void> verifierOTP(String code) async {

      String otp_received = _storage.read(AppConstants.USER_OTP).toString();

      if (code.contains(otp_received)){
        SnackbarUi.success("Code vérifié");
        Get.offAllNamed(AppRoutes.HOME);
      } else {
        SnackbarUi.error("Code incorrect, veuillez reéssayer svp");
        Get.offAllNamed(AppRoutes.HOME);
      }

  }

  Future<void> sendOTP() async {

    formKey.currentState!.save();

    if (formKey.currentState!.validate()) {

      dio.Response response = await this.registerRepo.sendOTP(data: formKey.currentState!.value);

      print(response.data.toString());

      if (response.statusCode == 200) {

        SnackbarUi.success("OTP envoyé, veuillez consulter votre mail");

        //envoyer le token OTP

        //Get.offAllNamed(AppRoutes.REGISTER_OTP, arguments:loginResponse.email);

      } else {
        SnackbarUi.error(response.data.toString());
      }


    } else {
      SnackbarUi.error("Erreur lors de l'envoi");
    }

  }


}