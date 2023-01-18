
import 'package:get/get.dart';
import '../controllers/profil_update_controller.dart';


class ProfilUpdateBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilUpdateController>(() => ProfilUpdateController());
        // Get.put<ProfilUpdateController>(ProfilUpdateController());
  }
}