
import 'package:get/get.dart';

import '../controllers/documents_controller.dart';
import '../controllers/profil_details_controller.dart';
import '../controllers/register_demande_controller.dart';


class DocumentsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DocumentsController>(() => DocumentsController());
    Get.lazyPut(()=>RegisterDemandeController());
  }
}