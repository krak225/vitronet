import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../constans/app_constants.dart';
import '../../../../shared_components/form_rechercher_depart.dart';
import '../../../../shared_components/header_text.dart';
import '../../../../utils/ui/theme/snackbar_ui.dart';
import '../../controllers/home_controller.dart';
import '../components/liste_departs.dart';

class DepartsScreen extends GetView<HomeController> {
  const DepartsScreen({Key? key}) : super(key: key);

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
    return Text("QRCodeView")/*QRCodeScanner(
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
      )*/;
  }

  Widget _buildContent({Function()? onPressedMenu, required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: Column(
        children: [
          const SizedBox(height: kSpacing),
          Row(
            children: [
              Expanded(
                child: LinearPercentIndicator(
                  percent: 4 / 12,
                  progressColor: Colors.blueGrey,
                  backgroundColor: Colors.blueGrey[200],
                ),
              ),
            ],
          ),
          const SizedBox(height: kSpacing * 1),
          Row(
            children: [
              const HeaderText("Liste des départs"),
              const Spacer(),
              const SizedBox(width: 10),
              ElevatedButton.icon(
                icon: const Icon(
                  EvaIcons.search,
                  size: 16,
                ),
                onPressed: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {

                        return FormRechercherDepart();

                      }
                  );
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 0,
                    backgroundColor: Colors.blue[300]
                ),
                label: const Text("Rechercher"),
              ),
            ],
          ),
          const SizedBox(height: kSpacing),
          Obx(() =>ListeDeparts(
            data: controller.fetchDeparts(controller.ville_depart_id.value, controller.ville_destination_id.value, controller.date_depart.value),
            onPressed: controller.onPressedTask,
            onPressedAssign: controller.onPressedAssignTask,
            onPressedMember: controller.onPressedMemberTask,
          ),
          ),

        ],
      ),
    );
  }

}
