import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';


import '../../controllers/home_controller.dart';

class ScanQRCodeScreen extends GetView<HomeController> {
  const ScanQRCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        controller: ScrollController(),
        child: _buildQRCodeView(
          onPressedMenu: () => controller.openDrawer(),
          context: context
        )
    );
  }

  Widget _buildQRCodeView({Function()? onPressedMenu, required BuildContext context}) {
    return Text("dsjkldm",
    );
  }

}
