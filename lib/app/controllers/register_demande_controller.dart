
import 'dart:io' as Io;
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
//import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_boarder/app/ui/pages/register_demande_page/widgets/register_upload_box_widget.dart';
import 'package:mime/mime.dart';

import '../config/app_constants.dart';
import '../data/provider/requests/document_dto.dart';
import '../routes/app_routes.dart';
import '../ui/theme/light_color.dart';
import '../ui/theme/snackbar_ui.dart';

class RegisterDemandeController extends GetxController {
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
    is_file_picked = false.obs;
    //print(doc);
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

  Future<void> pickImage(ImageSource source, String document_code, BuildContext context) async {
      print("Picking image for " + document_code);
      is_file_picked = true.obs;

      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: 10000,
        maxHeight: 10000,
        imageQuality: 25,
      );

      print(pickedFile);
      if(pickedFile != null) {
        file_picked = File(pickedFile.path);

        SessionSaveDocument(document_code, pickedFile.path.toString());

        //SnackbarUi.success(pickedFile.name.toString());

      }else{
        SnackbarUi.error("Erreur lors de la sélection de l'image");
      }

  }


  Future<void> pickFile(String document_code, BuildContext context) async {
    print("Picking image for " + document_code);
    is_file_picked = false.obs;

    FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );

    if(pickedFile != null) {
      file_picked = Io.File(pickedFile.files.single.path.toString());

      SessionSaveDocument(document_code, pickedFile.files.single.path.toString());

    }else{
      SnackbarUi.error("Erreur lors de la sélection du document");
    }

  }

  Future SessionSaveDocument(String document_code, String path) async {

    switch(document_code){
      case "CNI":
        box.write(AppConstants.USER_CNI, path);
        break;
      case "DPC":
        box.write(AppConstants.USER_DPC, path);
        break;
      case "CV":
        box.write(AppConstants.USER_CV, path);
        break;
      case "ATT":
        box.write(AppConstants.USER_ATT, path);
        break;
    }

    this.documents
        .firstWhere((element) => element.code == document_code)
        .path = path;

    this.documents
        .firstWhere((element) => element.code == document_code)
        .isImage = isImage(path);

    this.documents.refresh();

    print(documents.toString());

    /*Get.to(RegisterUploadBoxWidget(doc: current_document))?.then((value) {
      print ("GOING TO RegisterUploadBoxWidget");
      if (value != null) {
        this.documents
            .firstWhere((element) => element.code == document_code)
            .file = file_picked;
        this.documents.refresh();
      }
    });*/

    //Get.back(result: true);

    //SnackbarUi.success(document_code + " Stored in session");

  }

  void preciser_userinfo(String situation_id) {

    box.write(AppConstants.USER_SITUATION_ID, situation_id);
    print("USER_SITUATION_ID: "+situation_id);

    if(allDocumentAdded()) {

      Get.toNamed(AppRoutes.REGISTER_PROFIL);

    }else{
      SnackbarUi.info("Veuillez joindre les documents SVP");
    }

  }

  bool allDocumentAdded(){

    for(DocumentDto doc in this.documents){
      if(doc.path is Null){
        return false;
      }
    }

    return true;

  }

  getDocumentPhoto(DocumentDto doc) {

    print("doc.path=" + doc.path.toString());

    if (doc.path != null && doc.type == "img") {
      return Image(image:  FileImage(File(doc.path!)), fit: BoxFit.fitHeight);
    } else {

      return Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: doc.status ? LightColor.secondAccent : Colors.transparent,
            borderRadius: BorderRadius.circular(7),
            boxShadow: [
              BoxShadow(
                color: LightColor.lightGrey2,
                blurRadius: 3,
                offset: Offset(0, 4),
              )
            ],
          ),child:Image(
            image: AssetImage(doc.icon!),
          ),
      );
      return AssetImage(doc.icon!);
      //return NetworkImage('${userData.value.avatar}');
    }

  }


  bool isImage(String path) {
    String? mimeType = lookupMimeType(path);

    return mimeType!.startsWith('image/');

  }

  String getFileExtension(String fileName) {
    return "." + fileName.split('.').last;
  }

}



