
import 'package:get/get.dart';

import '../controllers/profil_controller.dart';


class ProfilBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilController>(() => ProfilController());
        // Get.put<ProfilController>(ProfilController());
  }
}