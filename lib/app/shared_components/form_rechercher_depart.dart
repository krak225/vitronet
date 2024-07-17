
import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:intl/intl.dart';
import '../constans/app_color.dart';
import '../features/dashboard/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../utils/ui/theme/custom_input_decoration.dart';
import '../utils/validator_state.dart';

class FormRechercherDepart extends StatelessWidget {
  final HomeController controller = Get.find();

  FormRechercherDepart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15), ),
          child:
          Container(
            color: Colors.white,
            child: Column(
            children: [
              SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(30),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  AutoSizeText(
                    "Rechercher un départ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                  ),
                  ],
                ),
                FormBuilder(
                key: controller.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(children: [
                  SizedBox(height: 10),

                  SizedBox(height: Get.height * 0.02),
                  FadeInRight(
                    child: FormBuilderDropdown(
                      name: 'ville_depart',
                      validator: ValidatorState.required,
                      decoration: CustomInputDecoration.style1(labelText: 'Ville de départ'),
                        items: controller.villes.map((ville) {
                          return DropdownMenuItem(
                            value: ville.villeId.toString(),
                            child: Text(ville.villeLibelle.toString()),
                          );
                        }).toList(),
                        onChanged: (selectedValue) {
                          controller.ville_depart_id.value = int.parse(selectedValue.toString());
                        }
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  FadeInRight(
                    child: FormBuilderDropdown(
                      name: 'ville_destination',
                      validator: ValidatorState.required,
                      decoration: CustomInputDecoration.style1(labelText: 'Ville de destination'),
                      items: controller.villes.map((ville) {
                        return DropdownMenuItem(
                          value: ville.villeId.toString(),
                          child: Text(ville.villeLibelle.toString()),
                        );
                      }).toList(),
                      onChanged: (selectedValue) {
                        controller.ville_destination_id.value = int.parse(selectedValue.toString());
                      }
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  FadeInRight(
                    child: FormBuilderDateTimePicker(
                      name: 'date_depart',
                      initialValue: DateTime.now(),
                      inputType: InputType.date,
                      format: DateFormat('dd/MM/yyyy'),
                      decoration: CustomInputDecoration.style1(labelText: 'Date de départ'),
                    ),
                  ),
                ]),
                ),
                SizedBox(height: Get.height * 0.04),
                FadeInRight(
                  duration: Duration(milliseconds: 600),
                  child:
                  Center(child: ElevatedButton.icon(
                      onPressed: () => controller.searchDeparts(),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        backgroundColor: AppColor.kPrimaryColor,
                        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
                      ),
                      icon: controller.isLoading.value ? Container(
                        width: 24,
                        height: 24,
                        padding: const EdgeInsets.all(2.0),
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                        ),
                      )
                          : const Icon(Icons.search),
                      label: const Text('Rechercher les départs'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
            ]),
              ),
            ),
            ]),
          ),
      )
    );

  }

}
