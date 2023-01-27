import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:job_boarder/app/routes/app_routes.dart';

import '../../global_widgets/button_style1_widget.dart';
import '../../global_widgets/input_label_widget.dart';
import '../../layouts/main/widgets/main_layout_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/register_demande_controller.dart';
import '../../theme/custom_input_decoration.dart';
import '../../theme/light_color.dart';
import '../../utils/validator_state.dart';
import 'widgets/ducoment_item_box_widget.dart';

class RegisterDemandePage extends GetView<RegisterDemandeController> {
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
                  "Ma demande d'inscription",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                ),
                SizedBox(
                  height: 15,
                ),
                AutoSizeText(
                  "Liste des situations possibles",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: LightColor.grey,
                  ),
                  maxLines: 1,
                ),
                AutoSizeText(
                  "Certaines situations ne permettent pas de s'inscrire en ligne. Vous pourrez vous en assurer en sélectionnant votre situation dans la liste ci-dessous :",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: LightColor.grey,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                FormBuilder(
                  key: controller.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(children: [
                    InputLabelWidget(text: "Liste des situations",),
                    SizedBox(
                      height: 10,
                    ),
                    FadeInRight(
                      child: FormBuilderDropdown(
                        name: 'situation',
                        validator: ValidatorState.required,
                        decoration: CustomInputDecoration.style2(
                            labelText: 'Sélectionnez votre situation'),
                        items: [
                          DropdownMenuItem(
                            child: Text('Je suis sans aucune activité professionnelle'),
                            value: '1',
                          ),
                          DropdownMenuItem(
                            child: Text('Je suis en cours de préavis'),
                            value: '2',
                          ),
                          DropdownMenuItem(
                            child: Text('Je suis en fonction ou en stage'),
                            value: '3',
                          ),
                        ],

                      ),
                    ),

                  ]),
                ),
                SizedBox(height: Get.height * 0.04),
                InputLabelWidget(text: "Je prépare mes documents",),
                AutoSizeText(
                  "Les documents utiles",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                ),
                Column(
                  children: controller.documents.map((doc) => DocumentItemBoxWidget( doc: doc, onTap: () => controller.selectDocument(doc),)).toList(),
                ),

                SizedBox(height: Get.height * 0.02),
                FadeInRight(
                  duration: Duration(milliseconds: 600),
                  child: ButtonStyle1Widget(
                    text: 'Je précise mon profil',
                    color: LightColor.second,
                    onPressed: () => Get.toNamed(AppRoutes.REGISTER_PROFIL),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
