
import 'package:get/get.dart';

import '../controllers/photo_update_controller.dart';


class PhotoUpdateBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhotoUpdateController>(() => PhotoUpdateController());
    //Get.lazyPut(()=>RegisterDemandeController());
  }
}