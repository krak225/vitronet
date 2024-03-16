import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../controllers/register_profil_controller.dart';
import '../../layouts/main/widgets/main_layout_view.dart';
import '../../theme/custom_input_decoration.dart';
import '../../theme/light_color.dart';
import '../../utils/validator_state.dart';

class RegisterProfilPage extends GetView<RegisterProfilController> {
  @override
  Widget build(BuildContext context) {

    return MainLayoutView(
        hPadding: 30,
        child: Obx(
              () =>
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText(
                          "Création de compte",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                        ),

                        TextButton(
                          onPressed: () => Get.back(),
                          child: AutoSizeText(
                            "Annuller",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: LightColor.second,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    AutoSizeText.rich(
                      TextSpan(
                        text: "En cliquant sur le bouton d'inscription, ",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: LightColor.grey,
                        ),
                        children: [
                          TextSpan(
                            text: "vous acceptez les conditions d'utilisation ",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: LightColor.grey,
                            ),
                          ),
                          TextSpan(
                            text: "de ..... et ",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: LightColor.grey,
                            ),
                          ),
                          TextSpan(
                            text: "reconnaissez la confidentialité et la politique",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: LightColor.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 30,
                    ),
                    FormBuilder(
                      key: controller.formKey,

                      ///initialValue: controller.initValues,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(children: [
                        FadeInRight(
                          child: FormBuilderTextField(
                            name: 'nom',
                            validator: ValidatorState.required,
                            initialValue: '',
                            decoration:
                            CustomInputDecoration.style1(labelText: 'Nom'),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        FadeInRight(
                          child: FormBuilderTextField(
                            name: 'prenoms',
                            validator: ValidatorState.required,
                            initialValue: '',
                            decoration:
                            CustomInputDecoration.style1(labelText: 'Prenoms'),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        FadeInRight(
                          child: FormBuilderDropdown(
                            name: 'genre',
                            validator: ValidatorState.required,
                            decoration: CustomInputDecoration.style2(labelText: 'Genre'),
                            items: [
                              DropdownMenuItem(
                                child: Text('Masculin'),
                                value: 'M',
                              ),
                              DropdownMenuItem(
                                child: Text('Féminin'),
                                value: 'F',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        FadeInRight(
                          child: FormBuilderTextField(
                            name: 'telephone',
                            initialValue: '',
                            keyboardType: TextInputType.number,
                            // validator: ValidatorState.email,
                            decoration:
                            CustomInputDecoration.style1(labelText: 'Téléphone'),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        FadeInRight(
                          child: FormBuilderDateTimePicker(
                            name: 'date_naissance',
                            validator: ValidatorState.required,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1960,1,1),
                            lastDate: DateTime.now(),
                            inputType: InputType.date,
                            decoration: CustomInputDecoration.style1(labelText: 'Date de naissance'),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        FadeInRight(
                          child: FormBuilderTextField(
                            name: 'lieu_naissance',
                            initialValue: '',
                            // validator: ValidatorState.email,
                            decoration:
                            CustomInputDecoration.style1(labelText: 'Lieu de naissance'),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        FadeInRight(
                          child: FormBuilderDropdown(
                            name: 'nationalite',
                            validator: ValidatorState.required,
                            decoration: CustomInputDecoration.style2(labelText: 'Nationalité'),
                            items: controller.pays.map((p) {
                              return DropdownMenuItem(
                                child: Text(p.nom),
                                value: p.id.toInt(),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        FadeInRight(
                          child: FormBuilderTextField(
                            name: 'lieu_residence',
                            initialValue: '',
                            // validator: ValidatorState.email,
                            decoration: CustomInputDecoration.style1(labelText: 'Lieu de résidence'),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        FadeInRight(
                          child: FormBuilderTextField(
                            name: 'departement',
                            initialValue: '',
                            // validator: ValidatorState.email,
                            decoration: CustomInputDecoration.style1(labelText: 'Département'),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        FadeInRight(
                          child: FormBuilderTextField(
                            name: 'commune',
                            initialValue: '',
                            // validator: ValidatorState.email,
                            decoration: CustomInputDecoration.style1(labelText: 'Commune'),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        FadeInRight(
                          child: FormBuilderDropdown(
                            name: 'handicap',
                            validator: ValidatorState.required,
                            decoration: CustomInputDecoration.style2(labelText: 'Handicap'),
                            items: [
                              DropdownMenuItem(
                                child: Text('OUI'),
                                value: '1',
                              ),
                              DropdownMenuItem(
                                child: Text('NON'),
                                value: '2',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        FadeInRight(
                          child: FormBuilderDropdown(
                            name: 'situation_matrimoniale',
                            validator: ValidatorState.required,
                            decoration: CustomInputDecoration.style2(labelText: 'Situation matrimoniale'),
                            items: [
                              DropdownMenuItem(
                                child: Text('Célibataire'),
                                value: '1',
                              ),
                              DropdownMenuItem(
                                child: Text('Marié(e)'),
                                value: '2',
                              ),
                              DropdownMenuItem(
                                child: Text('Divorcé(e)'),
                                value: '3',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        FadeInRight(
                          child: FormBuilderTextField(
                            name: 'nombre_enfants',
                            initialValue: '',
                            keyboardType: TextInputType.number,
                            // validator: ValidatorState.email,
                            decoration: CustomInputDecoration.style1(labelText: "Nombre d'enfants"),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        FadeInRight(
                          child: FormBuilderTextField(
                            name: 'emploi_souhaite',
                            initialValue: '',
                            // validator: ValidatorState.email,
                            decoration: CustomInputDecoration.style1(labelText: "Emploi souhaité"),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        FadeInRight(
                          child: FormBuilderTextField(
                            name: 'experience',
                            initialValue: '',
                            keyboardType: TextInputType.number,
                            // validator: ValidatorState.email,
                            decoration: CustomInputDecoration.style1(
                                labelText: "Année d'expérience"),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        FadeInRight(
                          child: FormBuilderDropdown(
                            name: 'diplome',
                            validator: ValidatorState.required,
                            decoration: CustomInputDecoration.style2(labelText: 'Dernier diplôme'),
                            items: controller.diplomes.map((item) {
                              return DropdownMenuItem(
                                child: Text(item.diplomelib),
                                value: item.diplomeId.toInt(),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        FadeInRight(
                          child: FormBuilderDropdown(
                            name: 'filiere',
                            validator: ValidatorState.required,
                            decoration: CustomInputDecoration.style2(labelText: 'Filière'),
                            items: controller.metiers.map((item) {
                              return DropdownMenuItem(
                                child: Text(item.metierLibelle),
                                value: item.metierId,
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        FadeInRight(
                          child: FormBuilderDropdown(
                            name: 'categorie_professionnelle',
                            validator: ValidatorState.required,
                            decoration: CustomInputDecoration.style2(labelText: 'Catégorie Professionnelle'),
                            items: controller.categories_professionnelles.map((item) {
                              return DropdownMenuItem(
                                child: Text(item.cateproLibelle),
                                value: item.cateproId.toInt(),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        FadeInRight(
                          child: FormBuilderDropdown(
                            name: 'type_demandeur',
                            validator: ValidatorState.required,
                            decoration: CustomInputDecoration.style2(labelText: 'Type de demandeur'),
                            items: [
                              DropdownMenuItem(
                                child: Text('Chômmeurs'),
                                value: '1',
                              ),
                              DropdownMenuItem(
                                child: Text('En activité'),
                                value: '2',
                              ),
                              DropdownMenuItem(
                                child: Text('Jeunes diplômés'),
                                value: '3',
                              ),
                              DropdownMenuItem(
                                child: Text('Stage'),
                                value: '4',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        FadeInRight(
                          child: FormBuilderDropdown(
                            name: 'niveau_instruction',
                            validator: ValidatorState.required,
                            decoration: CustomInputDecoration.style2(labelText: "Niveau d'instruction"),
                            items: controller.niveaux_instructions.map((n) {
                                return DropdownMenuItem(
                                  child: Text(n.niveauLibelle),
                                  value: n.niveauId.toInt(),
                                );
                              }).toList(),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        FadeInRight(
                          child: FormBuilderDropdown(
                            name: 'langue_internationale',
                            validator: ValidatorState.required,
                            decoration: CustomInputDecoration.style2(labelText: 'Langue internationale'),
                            items: controller.langues_internationales.map((item) {
                              return DropdownMenuItem(
                                child: Text(item.langueInterLibelle),
                                value: item.langueInterId.toInt(),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        FadeInRight(
                          child: FormBuilderDropdown(
                            name: 'langue_locale',
                            validator: ValidatorState.required,
                            decoration: CustomInputDecoration.style2(labelText: 'Langue locale'),
                            items: controller.langues_locales.map((item) {
                              return DropdownMenuItem(
                                child: Text(item.langueLocalLibelle),
                                value: item.langueLocalId.toInt(),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        FadeInRight(
                          child: FormBuilderTextField(
                            name: 'email',
                            initialValue: '',
                            // validator: ValidatorState.email,
                            decoration:
                            CustomInputDecoration.style1(labelText: 'Email'),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),

                        FadeInRight(
                          delay: Duration(milliseconds: 300),
                          child: FormBuilderTextField(
                            name: 'password',
                            initialValue: '',
                            obscureText: controller.isHide.value,
                            validator: ValidatorState.required,
                            decoration: CustomInputDecoration.style1(
                                labelText: 'Mot de passe',
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    controller.isHide.value =
                                    !controller.isHide.value;
                                  },
                                )),
                          ),
                        ),

                        SizedBox(height: Get.height * 0.02),

                        FadeInRight(
                          delay: Duration(milliseconds: 300),
                          child: FormBuilderTextField(
                            name: 'password_confirmation',
                            initialValue: '',
                            obscureText: controller.isHide.value,
                            validator: ValidatorState.required,
                            decoration: CustomInputDecoration.style1(
                                labelText: 'Confirmez le mot de passe',
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    controller.isHide2.value =
                                    !controller.isHide2.value;
                                  },
                                )),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                padding: EdgeInsets.only(top: 6),
                                child: Image.asset("assets/icons/check.png")),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(child: AutoSizeText(
                              "Le mot de passe doit comporter au moins 8 caractères", //, majuscules, minuscules et un code unique comme # % !",
                              style:TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: LightColor.black,
                              ),
                              ),),
                          ],
                        ),

                      ]),
                    ),
                    SizedBox(height: Get.height * 0.04),
                    //SizedBox(height: Get.height * 0.1),
                    FadeInRight(
                      duration: Duration(milliseconds: 600),
                      child: /*ButtonStyle1Widget(
                        text: 'Démarrer l’inscription',
                        color: LightColor.second,
                        onPressed: () => controller.register(),
                      ),*/
                      Center(
                        child: ElevatedButton.icon(
                            onPressed: () => controller.isLoading.value ? null : controller.register(),
                            style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16.0),),
                            icon: controller.isLoading.value ? Container(
                              width: 24,
                              height: 24,
                              padding: const EdgeInsets.all(2.0),
                              child: const CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 3,
                              ),
                            )
                                : const Icon(Icons.check),
                            label: const Text('Démarrer l’inscription'),
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height * 0.04),
                  ],
                ),
              ),
        ));
  }
}
