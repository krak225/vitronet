
import 'package:get/get.dart';

import '../controllers/job_controller.dart';
import '../controllers/offre_controller.dart';


class OffreBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OffreController>(() => OffreController());
    Get.lazyPut<JobController>(() => JobController());
  }
}