
import 'package:get/get.dart';

import '../controllers/register_profil_controller.dart';


class RegisterProfilBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterProfilController>(() => RegisterProfilController());
        // Get.put<RegisterProfilController>(RegisterProfilController());
  }
}