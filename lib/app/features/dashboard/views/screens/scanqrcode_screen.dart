import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:masi_qr_code_scanner/masi_qr_code_scanner.dart';

import '../../../../utils/ui/theme/snackbar_ui.dart';
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
    return QRCodeScanner(
        onScan: (String data) {
          HapticFeedback.vibrate();
          debugPrint(data);
          SnackbarUi.error("onScan: " + data);
          controller.verifTicket(data);
        },
        size: 800,
        borderLength: 300,
        borderWidth: 2,
        borderColor: Colors.red,
        borderRadius: 13,
      );
  }

}
