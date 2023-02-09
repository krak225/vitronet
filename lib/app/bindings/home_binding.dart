
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../controllers/main_controller.dart';


class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut(()=>MainController());
        // Get.put<HomeController>(HomeController());
  }
}