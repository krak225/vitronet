
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../data/provider/requests/document_dto.dart';
class RegisterDemandeController extends GetxController {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  final RxList<DocumentDto> documents = <DocumentDto>[
    DocumentDto(code: "CNI", name: "Carte d'identité Nationale ou Titre de séjour", icon: "assets/icons/carte-didentite.svg"),
    DocumentDto(code: "DPC", name: "Diplômes / Certificats ", icon: "assets/icons/facture.svg"),
    DocumentDto(code: "CV", name: "Curriculum Vitae (CV)", icon: "assets/icons/embauche.svg"),
    DocumentDto(code: "ATT", name: "Attestation employeur, certificat de travail ou bulletins de salaire", icon: "assets/icons/certificat.svg"),
  ].obs;


  selectDocument(DocumentDto doc) {
    print(doc);
  }




}