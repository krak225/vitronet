import '../../layouts/main/widgets/main_layout_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/start_controller.dart';

class StartPage extends GetView<StartController> {
  @override
  Widget build(BuildContext context) {
     return MainLayoutView(
            child: Center(
        child: Image.asset('assets/images/logo.jpg', width: Get.width * 0.6,),
      ),
    );
  }
}
