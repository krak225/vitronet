
import 'package:get/get.dart';

import '../controllers/profil_details_controller.dart';


class ProfilDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilDetailsController>(() => ProfilDetailsController());
  }
}