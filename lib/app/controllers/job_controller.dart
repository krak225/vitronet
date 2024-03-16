import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as dio;

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:job_boarder/app/ui/theme/snackbar_ui.dart';

import '../config/app_constants.dart';
import '../data/models/offre.dart';
import '../data/provider/repositories/auth_repo.dart';
import '../data/provider/repositories/offre_repo.dart';
import '../data/provider/responses/login_response.dart';
import 'main_controller.dart';

class JobController extends GetxController {

      GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
      final RxBool isHide = true.obs;
      final OffreRepo offreRepo = Get.find();
      GetStorage _storage = GetStorage();
      late List<Comment> comments = List.empty();

      Future<void> changeIndex(int? index) async {
         print(index);
         Get.find<MainController>().changeIndex(index);
      }


      Future<List<Comment>> fetchOffres(String type) async {
        print("fetchOffres");

        String user_id = _storage.read(AppConstants.USER_ID).toString();
        String TOKEN_STORAGE = _storage.read(AppConstants.TOKEN_STORAGE).toString();

        String url = AppConstants.API_URL + "/offres/"+user_id +"/"+type;
        print (url);

        final response = await http.get(Uri.parse(url), headers: {
          HttpHeaders.authorizationHeader: 'Bearer $TOKEN_STORAGE',
          HttpHeaders.contentTypeHeader: 'application/json',
        });


        if (response.statusCode == 200) {
          print(response.body);
          final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

          comments = parsed.map<Comment>((json) => Comment.fromMap(json)).toList();

          return comments;

        } else {

          print("response Body: " + response.body);

          throw Exception('Failed to load offres');

        }

      }


      Future<void> saveAlertEmploi() async {

        formKey.currentState!.save();
        print(formKey.currentState!.value);

        if (formKey.currentState!.validate()) {

          print(formKey.currentState!.value);

          dio.Response response = await this.offreRepo.saveAlertEmploi(data: formKey.currentState!.value);
          print(response.data);

          print(response.toString());
          if (response.statusCode == 200) {


            SnackbarUi.success("Alert Emploi enregistré avec succès !");

          } else {
            SnackbarUi.error("Erreur lors de l'enregistrement");
          }


        } else {
          print("validation failed: ");
        }

      }


}