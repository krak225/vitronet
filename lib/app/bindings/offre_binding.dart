
import 'package:get/get.dart';
import '../controllers/offre_controller.dart';


class OffreBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OffreController>(() => OffreController());
        // Get.put<OffreController>(OffreController());
  }
}