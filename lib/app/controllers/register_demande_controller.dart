
import 'dart:convert';
import 'dart:io' as Io;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
//import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_boarder/app/ui/pages/register_demande_page/widgets/register_upload_box_widget.dart';

import '../config/app_constants.dart';
import '../data/provider/requests/document_dto.dart';
import '../routes/app_routes.dart';
import '../ui/theme/snackbar_ui.dart';
class RegisterDemandeController extends GetxController {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  final ImagePicker _picker = ImagePicker();
  String base64_image_picked = "";
  final GetStorage box = GetStorage();

  final RxList<DocumentDto> documents = <DocumentDto>[
    DocumentDto(code: "CNI",
        name: "Carte d'identité Nationale ou Titre de séjour",
        icon: "assets/icons/carte-didentite.png"),
    DocumentDto(code: "DPC",
        name: "Diplômes / Certificats ",
        icon: "assets/icons/facture.png"),
    DocumentDto(code: "CV",
        name: "Curriculum Vitae (CV)",
        icon: "assets/icons/embauche.png"),
    DocumentDto(code: "ATT",
        name: "Attestation employeur, certificat de travail ou bulletins de salaire",
        icon: "assets/icons/certificat.png"),
  ].obs;


  selectDocument(DocumentDto doc) {
    print(doc);
    Get.to(RegisterUploadBoxWidget(doc: doc))?.then((value) {
      if (value != null) {
        this.documents
            .firstWhere((element) => element.code == doc.code)
            .status = true;
        this.documents.refresh();
      }
    });
  }

  Future<void> pickImage(ImageSource source, String document_code, BuildContext context) async {
      print("Picking image for " + document_code);

      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: 10000,
        maxHeight: 10000,
        imageQuality: 25,
      );

      print(pickedFile);
      if(pickedFile != null) {
        final bytes = Io.File(pickedFile.path).readAsBytesSync();
        base64_image_picked = base64Encode(bytes);

        SessionSaveDocument(document_code, base64_image_picked);

        //SnackbarUi.success(pickedFile.name.toString());

      }else{
        SnackbarUi.error("Erreur lors de la sélection de l'image");
      }

  }


  Future<void> pickFile(String document_code, BuildContext context) async {
    print("Picking image for " + document_code);

    FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );

    if(pickedFile != null) {
      print(pickedFile.files.single.path.toString());

      final bytes = Io.File(pickedFile.files.single.path.toString()).readAsBytesSync();
      base64_image_picked = base64Encode(bytes);

      SessionSaveDocument(document_code, base64_image_picked);

      //SnackbarUi.success("Document sélectionné avec succès");

    }else{
      SnackbarUi.error("Erreur lors de la sélection du document");
    }

  }

  Future SessionSaveDocument(String document_code, document_data) async {

    switch(document_code){
      case "CNI":
        box.write(AppConstants.USER_CNI, document_data);
        break;
      case "DPC":
        box.write(AppConstants.USER_DPC, document_data);
        break;
      case "CV":
        box.write(AppConstants.USER_CV, document_data);
        break;
      case "ATT":
        box.write(AppConstants.USER_ATT, document_data);
        break;
    }

    SnackbarUi.success(document_code + " Stored in session");

  }

  void preciser_userinfo(String situation_id) {

    box.write(AppConstants.USER_SITUATION_ID, situation_id);
    print("USER_SITUATION_ID: "+situation_id);

    Get.toNamed(AppRoutes.REGISTER_PROFIL);
  }

}



