import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';

import '../../../config/app_constants.dart';
import '../model/evenement.dart';

class EvenementsController extends GetxController {
  final scafoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  GlobalKey<FormBuilderState> formKey2 = GlobalKey<FormBuilderState>();

  GetStorage _storage = GetStorage();
  String TOKEN_STORAGE = "";

  final RxBool isLoading = false.obs;

  late List<Evenement> evenements = List.empty();
  void openDrawer() {
    if (scafoldKey.currentState != null) {
      scafoldKey.currentState!.openDrawer();
    }
  }


  Future<List<Evenement>> fetchEvenements() async {
    String TOKEN_STORAGE = _storage.read(AppConstants.TOKEN_STORAGE).toString();

    String url = AppConstants.API_URL + "/evenements";

    final response = await http.get(Uri.parse(url), headers: {
      HttpHeaders.authorizationHeader: 'Bearer $TOKEN_STORAGE',
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    print(url);

    if (response.statusCode == 200) {
      print(response.body);
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      evenements = parsed.map<Evenement>((json) => Evenement.fromJson(json)).toList();

      return evenements;

    } else {

      print("response Body: " + response.body);

      throw Exception('Failed to load evenements');

    }

  }

  @override
  void onInit() {

    TOKEN_STORAGE = _storage.read(AppConstants.TOKEN_STORAGE).toString();

    fetchEvenements();


  }



  bool onPressedTask(int index, Evenement data) {
    print ("onPressedTask");
    return true;
  }

}
