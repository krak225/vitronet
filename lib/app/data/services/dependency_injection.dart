// import '../../controllers/main_controller.dart';
import 'package:get/get.dart';

import '../../features/dashboard/controllers/dashboard_controller.dart';
import '../../features/dashboard/controllers/evenements_controller.dart';
import '../../features/dashboard/controllers/home_controller.dart';
import '../../features/dashboard/controllers/login_controller.dart';
import '../../features/dashboard/controllers/password_controller.dart';
import '../../features/dashboard/controllers/password_reset_controller.dart';
import '../provider/repositories/auth_repo.dart';
import '../provider/repositories/offre_repo.dart';
import '../provider/repositories/register_repo.dart';
import 'dio_service.dart';

class DependecyInjection {
  static void init() {
    Get.lazyPut<DioService>(() => DioService());
    // Get.put<MainController>(MainController());

    // init repositories
    Get.put<AuthRepo>(AuthRepo(dioService: Get.find()));
    Get.put<RegisterRepo>(RegisterRepo(dioService: Get.find()));
    Get.put<OffreRepo>(OffreRepo(dioService: Get.find()));

    Get.put<HomeController>(HomeController());
    Get.put<DashboardController>(DashboardController());
    Get.put<EvenementsController>(EvenementsController());
    Get.put<LoginController>(LoginController());
    Get.put<PasswordController>(PasswordController());
    Get.put<ResetPasswordController>(ResetPasswordController());

  }
}