import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:job_boarder/app/routes/app_routes.dart';

import '../../global_widgets/button_style1_widget.dart';
import '../../layouts/main/widgets/main_layout_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/register_init_controller.dart';
import '../../theme/light_color.dart';
import 'widgets/radio_box_widget.dart';

class RegisterInitPage extends GetView<RegisterInitController> {
  @override
  Widget build(BuildContext context) {
    return MainLayoutView(
        hPadding: 30,
        child: Obx(
          () => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                AutoSizeText(
                  "Création de compte",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 15,
                ),
                AutoSizeText(
                  "Que souhaitez-vous faire ?",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: LightColor.grey,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                RadioBoxWidget(
                  title: "Accéder aux services de recherche d'emploi :",
                  subtitle: "Vous souhaitez créer et diffuser votre profil de compétences, vous abonner aux offres d'emploi, postuler aux offres.",
                  isSelected: controller.isSelect.value,
                  onTap: () {
                    controller.isSelect.value = !controller.isSelect.value;
                  },

                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: LightColor.lightGrey2,
                        thickness: 1,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Ou",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: LightColor.lightGrey2,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Divider(
                        color: LightColor.grey,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                RadioBoxWidget(
                  title: "Vous inscrire comme demandeur d'emploi :",
                  subtitle: "Vous souhaitez effectuer votre demande d'inscription.",
                  isSelected: !controller.isSelect.value,
                  onTap: () {
                    controller.isSelect.value = !controller.isSelect.value;
                  },

                ),
                SizedBox(
                  height: Get.height * 0.15,
                ),
                FadeInRight(
                  duration: Duration(milliseconds: 600),
                  child: ButtonStyle1Widget(
                    text: 'Poursuivre',
                    onPressed: () => Get.toNamed(AppRoutes.REGISTER_DEMANDE),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FadeInRight(
                  duration: Duration(milliseconds: 600),
                  child: ButtonStyle1Widget(
                    color: LightColor.second,
                    text: 'Abandonner',
                    onPressed: () => Get.back(),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
