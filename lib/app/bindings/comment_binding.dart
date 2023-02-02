
import 'package:get/get.dart';
import 'package:job_boarder/app/controllers/main_controller.dart';
import '../controllers/comment_controller.dart';


class CommentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommentController>(() => CommentController());
    Get.lazyPut<MainController>(() => MainController());
        // Get.put<CommentController>(CommentController());
  }
}