
import 'package:get/get.dart';
import '../controllers/comment_controller.dart';


class CommentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommentController>(() => CommentController());
        // Get.put<CommentController>(CommentController());
  }
}