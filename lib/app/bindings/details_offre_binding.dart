
import 'package:get/get.dart';

import '../controllers/details_offre_controller.dart';


class DetailsOffreBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsOffreController>(() => DetailsOffreController());
        // Get.put<DetailsOffreController>(DetailsOffreController());
  }
}