import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:hello_depart/app/features/dashboard/controllers/intro_controller.dart';

import '../../../data/provider/repositories/register_repo.dart';
import '../controllers/dashboard_controller.dart';
import '../controllers/details_evenement_controller.dart';
import '../controllers/evenements_controller.dart';
import '../controllers/home_controller.dart';
import '../controllers/reglages_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => EvenementsController());
    Get.lazyPut(() => DetailsEvenementController());
    Get.lazyPut(() => IntroController());
    Get.lazyPut(() => ReglagesController());
  }
}
