import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get_storage/get_storage.dart';

import '../../../config/app_constants.dart';
import '../../global_widgets/button_style1_widget.dart';
import '../../global_widgets/default_header_widget.dart';
import '../../layouts/main/widgets/main_layout_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/profil_update_controller.dart';
import '../../theme/custom_input_decoration.dart';
import '../../theme/light_color.dart';
import '../../utils/validator_state.dart';

class ProfilUpdatePage extends GetView<ProfilUpdateController> {
  @override
  Widget build(BuildContext context) {

    GetStorage _storage = GetStorage();
    String email = _storage.read(AppConstants.USER_EMAIL).toString();
    String firstname = _storage.read(AppConstants.USER_FIRSTNAME).toString();
    String lastname = _storage.read(AppConstants.USER_LASTNAME).toString();
    String telephone = _storage.read(AppConstants.USER_TELEPHONE).toString();
    String adresse = _storage.read(AppConstants.USER_ADRESSE).toString();
    String genre = _storage.read(AppConstants.USER_GENRE).toString();
    String photo = _storage.read(AppConstants.USER_PHOTO).toString();
    String experience = _storage.read(AppConstants.USER_EXPERIENCE).toString();
    String diplome = _storage.read(AppConstants.USER_DIPLOME).toString();
    int diplome_id = 0;

    return MainLayoutView(
        child: Column(
      children: [
        DefaultHeaderWidget(title: 'Profil'),
        Expanded(
            child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        // color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xff111111).withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(0, 14))
                        ], borderRadius: BorderRadius.circular(50)),
                    child: Stack(
                      children: [
                        InkWell(
                          onTap: ()=> controller.pickPhoto(),
                          child:GetBuilder<ProfilUpdateController>(
                            builder: (_) {
                              return controller.getAvatar(photo);
                            },
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            // height: 40,
                            // width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              // border: Border.all(
                              //   width: 4,
                              //   color: Theme.of(context).scaffoldBackgroundColor,
                              // ),
                              color: LightColor.second,
                            ),
                            child: InkWell(
                                onTap: ()=> controller.pickPhoto(),
                                child: Image.asset('assets/images/photo.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                AutoSizeText("Informations de l'utilisateur",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: LightColor.primary)),
                SizedBox(height: 20),
                FormBuilder(
                  key: controller.formKey,

                  ///initialValue: controller.initValues,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(children: [
                    Row(
                      children: [
                        Expanded(
                          child: FadeInRight(
                            child: FormBuilderTextField(
                              name: 'prenoms',
                              initialValue: firstname,
                              // validator: ValidatorState.email,
                              decoration: CustomInputDecoration.style1(
                                  labelText: 'Prénoms'),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: FadeInRight(
                            child: FormBuilderTextField(
                              name: 'nom',
                              initialValue: lastname,
                              // validator: ValidatorState.email,
                              decoration: CustomInputDecoration.style1(
                                  labelText: 'Nom de famille'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.04),
                    FadeInRight(
                      child: FormBuilderTextField(
                        name: 'email',
                        initialValue: email,
                        validator: ValidatorState.email,
                        decoration:
                            CustomInputDecoration.style1(labelText: 'Email'),
                      ),
                    ),
                    SizedBox(height: Get.height * 0.04),
                    Row(
                      children: [
                        Expanded(
                          child: FadeInRight(
                            child: FormBuilderTextField(
                              name: 'genre',
                              initialValue: genre,
                              // validator: ValidatorState.email,
                              decoration: CustomInputDecoration.style1(
                                  labelText: 'Le genre'),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: FadeInRight(
                            child: FormBuilderTextField(
                              name: 'telephone',
                              initialValue: telephone,
                              // validator: ValidatorState.email,
                              decoration: CustomInputDecoration.style1(
                                  labelText: 'Phone'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.04),
                    Row(
                      children: [
                        Expanded(
                          child: FadeInRight(
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
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: FadeInRight(
                            child: FormBuilderTextField(
                              name: 'experience',
                              initialValue: experience,
                              // validator: ValidatorState.email,
                              decoration: CustomInputDecoration.style1(
                                  labelText: "Année d'expérience"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.04),
                    FadeInRight(
                      child: FormBuilderTextField(
                        name: 'adresse',
                        initialValue: adresse +" ",
                        //validator: ValidatorState.email,
                        decoration:
                        CustomInputDecoration.style1(labelText: 'Adresse'),
                      ),
                    ),
                  ]),
                ),
                SizedBox(height: 20),
                /*Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText(
                      "Adresse",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                          color: LightColor.primary
                      ),
                      maxLines: 1,
                    ),

                    TextButton(
                      onPressed: () {},
                      child: AutoSizeText(
                        "Ajouter plus",
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
                ListTile(
                  leading: Icon(Icons.location_on_outlined, color: Colors.black, size: 32,),
                  title: Text(adresse),//00 Niamey avenue suite 00
                  subtitle: Text(''),//00 Niger avenue suite 00 Niamey
                ),*/
                Divider(
                  color: LightColor.lightGrey2,
                ),

                SizedBox(height: Get.height * 0.05),

                FadeInRight(
                  duration: Duration(milliseconds: 600),
                  child: ButtonStyle1Widget(
                    text: 'Sauvegarder',
                    color: LightColor.second,
                    onPressed: () => controller.update_profile(),
                  ),
                ),
              ],
            ),
          ),
        ))
      ],
    ));
  }
}
