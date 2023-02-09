
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../config/app_constants.dart';
import '../data/models/offre.dart';
import '../data/provider/repositories/offre_repo.dart';
import '../ui/theme/snackbar_ui.dart';

class DetailsOffreController extends GetxController {
      GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
      final RxBool isHide = false.obs;
      late RxBool isPostulable = true.obs;
      final OffreRepo offreRepo = Get.find();

      Future<Comment> fetchOffre(int id) async {

        String url = AppConstants.API_URL + "/offres/" + id.toString();
        print (url);
        final response = await http.get(Uri.parse(url), headers: {
          HttpHeaders.authorizationHeader: 'bearer token',
          HttpHeaders.contentTypeHeader: 'application/json',
        });

        if (response.statusCode == 200) {

          final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

          return parsed.map<Comment>((json) => Comment.fromMap(json));

        } else {

          throw Exception('Failed to load offre');
        }
      }

      Future<void> postuler(String id) async {

        formKey.currentState!.save();

        dio.Response response = await this.offreRepo.postuler(data: formKey.currentState!.value);

        if (response.statusCode == 200) {

          SnackbarUi.success("Votre canditature a bien été enregistrée");

          isPostulable = false.obs;

          //Get.offAllNamed(AppRoutes.HOME);

        } else {

          SnackbarUi.error(response.data['message']);
        }


      }


}