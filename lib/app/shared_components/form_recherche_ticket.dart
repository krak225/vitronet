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

class FormRechercheTicket extends StatelessWidget {
  final HomeController controller = Get.find();

  FormRechercheTicket({required this.evenement_id, required this.onVerificationSuccess, Key? key}) : super(key: key);

  final int evenement_id;
  final VoidCallback onVerificationSuccess;

  @override
  Widget build(BuildContext context) {

    var _numero_ticket = '';

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
                    "Rechercher un ticket",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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
                  FadeInRight(
                    child: FormBuilderTextField(
                      name: 'numero_ticket',
                      initialValue: null,
                      //validator: ValidatorState.required,
                      //decoration: CustomInputDecoration.style1(labelText: 'Numéro du ticket'),
                      decoration: InputDecoration(labelText: "Numéro du ticket"),
                      style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  FadeInRight(
                    child: FormBuilderTextField(
                      name: 'nom_acheteur',
                      initialValue: null,
                      //validator: ValidatorState.required,
                      //decoration: CustomInputDecoration.style1(labelText: 'Numéro du ticket'),
                      decoration: InputDecoration(labelText: "Nom de l'acheteur"),
                      style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  FadeInRight(
                    child: FormBuilderTextField(
                      name: 'numero_telephone',
                      initialValue: null,
                      //validator: ValidatorState.required,
                      //decoration: CustomInputDecoration.style1(labelText: 'Numéro du ticket'),
                      decoration: InputDecoration(labelText: "Numéro de téléphone"),
                      style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  /*FadeInRight(
                    child: FormBuilderDateTimePicker(
                      name: 'date_achat',
                      initialValue: DateTime.now(),
                      inputType: InputType.date,
                      format: DateFormat('dd/MM/yyyy'),
                      decoration: CustomInputDecoration.style1(labelText: "Date d'achat"),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),*/
                ]),
                ),
                SizedBox(height: Get.height * 0.04),
                FadeInRight(
                  duration: Duration(milliseconds: 600),
                  child:
                  Center(child: ElevatedButton.icon(
                      onPressed: () => controller.rechercherTicket(),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.black, //padding: const EdgeInsets.symmetric(horizontal: , vertical: 0),
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
                      label: const Text('Rechercher'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
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
