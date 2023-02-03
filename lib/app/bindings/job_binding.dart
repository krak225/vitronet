
import 'package:get/get.dart';
import 'package:job_boarder/app/controllers/main_controller.dart';
import '../controllers/job_controller.dart';


class CommentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobController>(() => JobController());
    Get.lazyPut<MainController>(() => MainController());
  }
}