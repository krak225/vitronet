import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:flutter/cupertino.dart';

import '../../../config/app_constants.dart';

class ReglagesController extends GetxController {
  final scafoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  GlobalKey<FormBuilderState> formKey2 = GlobalKey<FormBuilderState>();

  GetStorage _storage = GetStorage();
  String TOKEN_STORAGE = "";
  String USER_FIRSTNAME="", USER_LASTNAME = "", USER_EMAIL= "", USER_ORGANISATEUR = "";

  final RxBool isLoading = false.obs;

  void openDrawer() {
    if (scafoldKey.currentState != null) {
      scafoldKey.currentState!.openDrawer();
    }
  }


  @override
  void onInit() {

    TOKEN_STORAGE = _storage.read(AppConstants.TOKEN_STORAGE).toString();
    USER_FIRSTNAME = _storage.read(AppConstants.USER_FIRSTNAME).toString();
    USER_LASTNAME = _storage.read(AppConstants.USER_LASTNAME).toString();
    USER_EMAIL = _storage.read(AppConstants.USER_EMAIL).toString();
    USER_ORGANISATEUR = _storage.read(AppConstants.USER_ORGANISATEUR).toString();

  }

}
