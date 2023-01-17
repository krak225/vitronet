
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:job_boarder/app/ui/pages/register_demande_page/widgets/register_upload_box_widget.dart';

import '../data/provider/requests/document_dto.dart';
class RegisterDemandeController extends GetxController {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  final RxList<DocumentDto> documents = <DocumentDto>[
    DocumentDto(code: "CNI", name: "Carte d'identité Nationale ou Titre de séjour", icon: "assets/icons/carte-didentite.png"),
    DocumentDto(code: "DPC", name: "Diplômes / Certificats ", icon: "assets/icons/facture.png"),
    DocumentDto(code: "CV", name: "Curriculum Vitae (CV)", icon: "assets/icons/embauche.png"),
    DocumentDto(code: "ATT", name: "Attestation employeur, certificat de travail ou bulletins de salaire", icon: "assets/icons/certificat.png"),
  ].obs;


  selectDocument(DocumentDto doc) {
    print(doc);
    Get.to(RegisterUploadBoxWidget(doc: doc))?.then((value) {
      if (value != null) {
        this.documents.firstWhere((element) => element.code == doc.code).status = true ;
        this.documents.refresh();
      }

    });
  }




}