import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:image_picker/image_picker.dart';

import '../data/provider/repositories/auth_repo.dart';
import '../data/provider/repositories/register_repo.dart';
import '../data/provider/responses/login_response.dart';
import '../ui/theme/snackbar_ui.dart';

class PhotoUpdateController extends GetxController {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  String path =  '';
  final picker = ImagePicker();

  Future<void> pickPhoto() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {

      path = pickedFile.path;

    } else {
      print('Aucune photo sélectionnée.');
    }
    update();
  }

  getAvatar() {
    if (path != '') {
      return Image(image: FileImage(File(path)));
    } else {
      return Image(image: AssetImage('assets/images/profil.png'));
      //return NetworkImage('${userData.value.avatar}');
    }
  }

  void uploadPic(BuildContext context) async {

  }

}