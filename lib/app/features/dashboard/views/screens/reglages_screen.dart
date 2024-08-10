import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../constans/app_constants.dart';
import '../../../../shared_components/header_text.dart';
import '../../controllers/reglages_controller.dart';

class ReglagesScreen extends GetView<ReglagesController> {
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
              const HeaderText("Paramètres"),
              const Spacer(),
              const SizedBox(width: 10),
            ],
          ),
          const SizedBox(height: kSpacing),

          FadeInRight(
            child: Row(
              children: [
                Expanded(
                    child: Text("A propos", textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold),)
                ),
              ],
            ),
          ),
          Divider(height: 1, color: Colors.grey[100],),
          SizedBox(height: Get.height * 0.02),
          FadeInRight(
            child: Row(
              children: [
                Expanded(
                  child: FadeInRight(
                    child: Text("Login : ", style:TextStyle(fontSize: 12),),
                  ),
                ),
                Expanded(
                    child: Text(controller.USER_EMAIL, textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),)
                ),
              ],
            ),
          ),
          Divider(height: 1, color: Colors.grey[100],),
          SizedBox(height: Get.height * 0.02),
          FadeInRight(
            child: Row(
              children: [
                Expanded(
                  child: FadeInRight(
                    child: Text("Nom : ", style:TextStyle(fontSize: 12),),
                  ),
                ),
                Expanded(
                    child: Text(controller.USER_LASTNAME, textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),)
                ),
              ],
            ),
          ),
          Divider(height: 1, color: Colors.grey[100],),
          SizedBox(height: Get.height * 0.02),
          FadeInRight(
            child: Row(
              children: [
                Expanded(
                  child: FadeInRight(
                    child: Text("Prénoms : ", style:TextStyle(fontSize: 12),),
                  ),
                ),
                Expanded(
                    child: Text(controller.USER_FIRSTNAME, textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),)
                ),
              ],
            ),
          ),
          Divider(height: 1, color: Colors.grey[100],),
          SizedBox(height: Get.height * 0.02),
          FadeInRight(
            child: Row(
              children: [
                Expanded(
                  child: FadeInRight(
                    child: Text("Affilié à : ", style:TextStyle(fontSize: 12),),
                  ),
                ),
                Expanded(
                    child: Text(controller.USER_ORGANISATEUR, textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),)
                ),
              ],
            ),
          ),
          Divider(height: 1, color: Colors.grey[100],),
          SizedBox(height: Get.height * 0.02),
          const SizedBox(height: kSpacing),
          Row(
            children: [
              const HeaderText("Réglages"),
            ],
          ),
          Divider(height: 1, color: Colors.grey[100],),
          SizedBox(height: Get.height * 0.02),
          FadeInRight(
            child: Row(
              children: [
                Expanded(
                  child: FadeInRight(
                    child: Text("Langue : ", style:TextStyle(fontSize: 12),),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: FadeInRight(
                      child: Text("Français", textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),)
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
