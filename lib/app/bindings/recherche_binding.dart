
import 'package:get/get.dart';
import '../controllers/recherche_controller.dart';


class RechercheBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RechercheController>(() => RechercheController());
  }
}