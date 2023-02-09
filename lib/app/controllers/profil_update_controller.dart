
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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

  String _filePath =  '';
  final picker = ImagePicker();

  Future<void> pickPhoto() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {

      _filePath = pickedFile.path;

    } else {
      print('Aucune photo sélectionnée.');
    }
    update();
  }

  getAvatar(String photo) {

    if (_filePath != '') {

      return ClipOval(
        child: SizedBox.fromSize(
          size: Size.fromRadius(48),
          child: Image.file(File(_filePath), fit: BoxFit.cover),
        ),
      );

    } else {

      if(photo.length > 4){

        return ClipOval(
          child: SizedBox.fromSize(
            size: Size.fromRadius(48),
            child: Image.network(photo, fit: BoxFit.cover),
          ),
        );

      }else {

        return CircleAvatar(
          radius: 48,
          backgroundImage: AssetImage('assets/images/profil.png'),
        );

      }

    }

  }


  Future<void> update_profile() async {
    //box.write('isLogin', true);
    //print(" update_profile IS CALLED ");

    formKey.currentState!.save();

    if (formKey.currentState!.validate()) {
      //isLoading.value = true;
      print(formKey.currentState!.value);

      var data = Map<String, dynamic>.from(formKey.currentState!.value);
      print(this._filePath);
      if(this._filePath != ''){
        File file = File(this._filePath);
        data['photo'] = await dio.MultipartFile.fromFile(file.path, filename: 'photo');
      }

      var formData = dio.FormData.fromMap(data);

      print(formData.toString());

      dio.Response response = await this.registerRepo.update_profile(data: formData);

      if (response.statusCode == 200) {

        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        this.authRepo.sessionTokenDataSave(loginResponse);

        print(loginResponse.toString());
        //isLoading.value = true;
        SnackbarUi.success("Profil mise à jour avec succès");

      } else {
        SnackbarUi.error(response.data.toString());
        print(response.toString());
        //isLoading.value = false;
      }


    } else {
      SnackbarUi.error("Veuillez renseigner correctement le formulaire");
    }
  }

}