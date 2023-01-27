
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../config/app_constants.dart';
import '../routes/app_routes.dart';
class ProfilController extends GetxController {

  Future<void> logout() async {

    //effacer les données en session

    print("deconnecté");
    Get.offAllNamed(AppRoutes.LOGIN);
  }

}