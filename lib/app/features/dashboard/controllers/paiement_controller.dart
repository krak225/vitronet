import 'dart:async';
import 'package:dio/dio.dart' as dio;

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../config/routes/app_pages.dart';
import '../../../data/provider/repositories/register_repo.dart';
import '../../../utils/ui/theme/snackbar_ui.dart';
import 'home_controller.dart';

class PaiementController extends GetxController with GetSingleTickerProviderStateMixin {

  final HomeController hcontroller = Get.find();
  final RegisterRepo registerRepo = Get.find();
  final RxBool isLoading = false.obs;

  final scafoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  PaiementController();

  //enregistrer la facture et passer au paiement
  Future<void> payerTicket() async {

    print ("paiement de ticket");

    formKey.currentState!.save();

    if (formKey.currentState!.validate()) {
      isLoading.value = true;

      var data = Map<String, dynamic>.from(formKey.currentState!.value);

    var formData = dio.FormData.fromMap(data);
    print(formData);
    dio.Response response = await this.registerRepo.payerTicket(data: formData);

    if (response.statusCode == 200) {
      isLoading.value = false;

      //la facture a été enregistrée, procéder au paiement via cinetpay

      //SnackbarUi.success("Facture enregistrée avec succès");
      
      Get.to(AppPages.paiement);

    } else {
      print(response.data);

      SnackbarUi.error(response.data.toString());
      isLoading.value = false;
    }

      isLoading.value = false;

    } else {
      SnackbarUi.error("Veuillez renseigner correctement le formulaire");
      isLoading.value = false;
    }

  }

}
