
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../config/app_constants.dart';
import '../routes/app_routes.dart';
class StartController extends GetxController {
  final GetStorage box = GetStorage();

  checkSession() {
    if (box.read(AppConstants.USER_STORAGE) != null) {
      Get.offNamed(AppRoutes.HOME);
    } else {
      Get.offNamed(AppRoutes.ONBOARDING);
    }
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    // box.erase();
    await Future.delayed(Duration(seconds: 3));
    this.checkSession();
  }
}