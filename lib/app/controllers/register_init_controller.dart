
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../config/app_constants.dart';
import '../routes/app_routes.dart';
class RegisterInitController extends GetxController {
  RxBool isSelect = false.obs;
  final GetStorage box = GetStorage();

  Future<void> setProfil(String profil_id) async {
    SessionSaveProfil(profil_id);

    Get.toNamed(AppRoutes.REGISTER_DEMANDE);

  }

  Future SessionSaveProfil(String profil_id) async {

    box.write(AppConstants.USER_PROFIL_ID, profil_id);
    print("USER_PROFIL_ID: "+profil_id);

  }

}