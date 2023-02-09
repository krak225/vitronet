// import '../../controllers/main_controller.dart';
import 'package:get/get.dart';

import '../../controllers/navigation_controller.dart';
import '../../controllers/start_controller.dart';
import '../provider/repositories/auth_repo.dart';
import '../provider/repositories/offre_repo.dart';
import '../provider/repositories/register_repo.dart';
import 'dio_service.dart';

class DependecyInjection {
  static void init() {
    Get.put<NavigationController>(NavigationController());
    Get.lazyPut<DioService>(() => DioService());
    // Get.put<MainController>(MainController());
    Get.put<StartController>(StartController());
    
    // init repositories
    Get.put<AuthRepo>(AuthRepo(dioService: Get.find()));
    Get.put<RegisterRepo>(RegisterRepo(dioService: Get.find()));
    Get.put<OffreRepo>(OffreRepo(dioService: Get.find()));
  }
}