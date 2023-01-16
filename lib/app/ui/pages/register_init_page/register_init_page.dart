import '../../layouts/main/widgets/main_layout_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/register_init_controller.dart';

class RegisterInitPage extends GetView<RegisterInitController> {
  @override
  Widget build(BuildContext context) {
    return MainLayoutView(
            child: Center(
        child: Text('RegisterInit'),
      ),
    );
  }
}
