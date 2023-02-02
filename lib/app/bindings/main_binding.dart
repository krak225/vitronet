
import 'package:get/get.dart';
import 'package:job_boarder/app/controllers/comment_controller.dart';
import 'package:job_boarder/app/controllers/search_controller.dart';
import '../controllers/home_controller.dart';
import '../controllers/main_controller.dart';
import '../controllers/offre_controller.dart';


class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<SearchController>(() => SearchController());
    Get.lazyPut<CommentController>(() => CommentController());
    Get.lazyPut<OffreController>(() => OffreController());

    // Get.put<HomeController>(HomeController());
  }
}