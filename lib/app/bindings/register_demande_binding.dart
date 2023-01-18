
import 'package:get/get.dart';
import '../controllers/register_demande_controller.dart';


class RegisterDemandeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterDemandeController>(() => RegisterDemandeController());
        // Get.put<RegisterDemandeController>(RegisterDemandeController());
  }
}