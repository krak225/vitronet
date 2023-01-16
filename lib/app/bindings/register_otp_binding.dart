
import 'package:get/get.dart';
import '../controllers/register_otp_controller.dart';


class RegisterOtpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterOtpController>(() => RegisterOtpController());
        // Get.put<RegisterOtpController>(RegisterOtpController());
  }
}