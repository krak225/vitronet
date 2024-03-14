import 'dart:io' as Io;

import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../data/provider/requests/document_dto.dart';
import '../ui/pages/register_demande_page/widgets/register_upload_box_widget.dart';
class DocumentsController extends GetxController {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  final ImagePicker _picker = ImagePicker();
  String base64_image_picked = "";
  late Io.File file_picked;
  final GetStorage box = GetStorage();
  RxBool is_file_picked = false.obs;
  late DocumentDto current_document;

  final RxList<DocumentDto> documents = <DocumentDto>[
    DocumentDto(code: "CNI",
      name: "Carte d'identité Nationale ou Titre de séjour",
      icon: "assets/icons/carte-didentite.png",
    ),/*
    DocumentDto(code: "DPC",
        name: "Diplômes / Certificats ",
        icon: "assets/icons/facture.png",
    ),
    DocumentDto(code: "CV",
        name: "Curriculum Vitae (CV)",
        icon: "assets/icons/embauche.png",
    ),
    DocumentDto(code: "ATT",
        name: "Attestation employeur, certificat de travail ou bulletins de salaire",
        icon: "assets/icons/certificat.png",
    ),*/
  ].obs;

  DocumentsController(){
    //documents.forEach((doc) { doc.file = default_file; });
  }

  selectDocument(DocumentDto doc) {
    is_file_picked = false.obs;
    print(doc);
    current_document = doc;

    Get.to(RegisterUploadBoxWidget(doc: doc))?.then((value) {
      if (value != null) {
        this.documents
            .firstWhere((element) => element.code == doc.code)
            .status = true;
        this.documents.refresh();
      }
    });
  }

}