import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../shared_components/account_amount.dart';
import '../../../../shared_components/scan_button.dart';
import '../../../../utils/helpers/app_helpers.dart';
import '../../../../constans/app_constants.dart';
import '../../../../shared_components/header_text.dart';
import '../../../../shared_components/task_progress.dart';
import '../../controllers/home_controller.dart';
import '../components/header_verification_tickets.dart';
import '../components/liste_tickets.dart';
import '../components/task_in_progress.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        controller: ScrollController(),
        child: _buildHomeContent2(
          onPressedMenu: () => controller.openDrawer(),
        )
    );
  }

  Widget _buildHomeContent2({Function()? onPressedMenu}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: kSpacing),
          HeaderVerificationTickets(),
          ScanButton(controller: controller),
          const SizedBox(height: kSpacing),
          HeaderVerificationTickets(),
          //const SizedBox(height: kSpacing),
          //TaskInProgress(data: controller.taskInProgress),
          //const SizedBox(height: kSpacing * 2),
          /*ListeTickets(
            data: controller.fetchTickets(0),
            onPressed: controller.onPressedTask,
          ),*/
        ],
      ),
    );
  }

}
