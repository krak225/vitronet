
import 'package:get/get.dart';
import '../controllers/register_init_controller.dart';


class RegisterInitBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterInitController>(() => RegisterInitController());
        // Get.put<RegisterInitController>(RegisterInitController());
  }
}