import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:job_boarder/app/controllers/main_controller.dart';

import '../../../../config/app_constants.dart';
import '../../../../controllers/job_controller.dart';
import '../../../global_widgets/button_style1_widget.dart';
import '../../../theme/custom_input_decoration.dart';
import '../../../utils/validator_state.dart';

class ConfiAlertEmploiWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final JobController controller = Get.put(JobController());

    return Container(
        height: 340,
        color: Colors.white,
        child:Padding(
          padding: const EdgeInsets.all(16.0),
          child: FormBuilder(
            key: controller.formKey,
            ///initialValue: controller.initValues,
            autovalidateMode: AutovalidateMode.disabled,
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  // height: 85,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10, ),
                  // color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Icon(Icons.settings_suggest, size: 24, color: Colors.black,))
                      ,
                      Expanded(
                        flex: 5,
                        child: AutoSizeText("Mon agent de recherche",
                          maxLines: 1,
                          minFontSize: 16,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Container()
                      )
                    ],
                  ),
                ),
                FadeInRight(
                  delay: Duration(milliseconds: 300),
                  child: FormBuilderDropdown(
                    name: 'diplome',
                    validator: ValidatorState.required,
                    decoration: CustomInputDecoration.style2(labelText: 'Dernier diplôme'),
                    items: [
                      DropdownMenuItem(
                        child: Text('Bac'),
                        value: '1',
                      ),
                      DropdownMenuItem(
                        child: Text('Bac +1'),
                        value: '2',
                      ),
                      DropdownMenuItem(
                        child: Text('Bac +2'),
                        value: '3',
                      ),
                      DropdownMenuItem(
                        child: Text('Bac +3'),
                        value: '4',
                      ),
                      DropdownMenuItem(
                        child: Text('Bac +4'),
                        value: '5',
                      ),
                      DropdownMenuItem(
                        child: Text('Bac +5'),
                        value: '6',
                      ),
                      DropdownMenuItem(
                        child: Text('Bac +5 et plus'),
                        value: '7',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Get.height * 0.02),
                FadeInRight(
                  delay: Duration(milliseconds: 300),
                  child: FormBuilderDropdown(
                    name: 'metier',
                    validator: ValidatorState.required,
                    decoration: CustomInputDecoration.style2(labelText: 'Métier'),
                    items: [
                      DropdownMenuItem(
                        child: Text('Informaticque'),
                        value: '1',
                      ),
                      DropdownMenuItem(
                        child: Text('Commerce'),
                        value: '2',
                      ),
                      DropdownMenuItem(
                        child: Text('Finance'),
                        value: '3',
                      ),
                      DropdownMenuItem(
                        child: Text('Industrie'),
                        value: '4',
                      ),
                      DropdownMenuItem(
                        child: Text('Management, Gestion'),
                        value: '5',
                      ),
                      DropdownMenuItem(
                        child: Text('Tout'),
                        value: '7',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Get.height * 0.04),
                FadeInRight(
                  duration: Duration(milliseconds: 600),
                  child: ButtonStyle1Widget(
                    text: 'Appliquer',
                    onPressed: () => controller.saveAlertEmploi(),//{print("search performed")},
                  ),
                ),
              ]),
            ),
          ),
        ),
      );
  }
}