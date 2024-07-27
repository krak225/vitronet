import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:hello_depart/app/features/dashboard/controllers/evenements_controller.dart';
import 'package:hello_depart/app/features/dashboard/views/components/liste_evenements.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../constans/app_constants.dart';
import '../../../../shared_components/header_text.dart';

class ReglagesScreen extends GetView<EvenementsController> {
  const ReglagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        controller: ScrollController(),
        child: _buildReglagesContent(
          onPressedMenu: () => controller.openDrawer(),
          context: context
        )
    );
  }

  Widget _buildReglagesContent({Function()? onPressedMenu, required BuildContext context}) {
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
              const HeaderText("Réglages"),
              const Spacer(),
              const SizedBox(width: 10),

            ],
          ),
          const SizedBox(height: kSpacing),
        ],
      ),
    );
  }

}
