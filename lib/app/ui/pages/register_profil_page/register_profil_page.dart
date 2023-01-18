import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../routes/app_routes.dart';
import '../../global_widgets/button_style1_widget.dart';
import '../../layouts/main/widgets/main_layout_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/register_profil_controller.dart';
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
                          onPressed: () {},
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
                            initialValue: 'TISSI',
                            // validator: ValidatorState.email,
                            decoration:
                            CustomInputDecoration.style1(labelText: 'Nom'),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.04),
                        FadeInRight(
                          child: FormBuilderTextField(
                            name: 'prenom',
                            initialValue: 'Armel',
                            // validator: ValidatorState.email,
                            decoration:
                            CustomInputDecoration.style1(labelText: 'Prenom'),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.04),
                        FadeInRight(
                          child: FormBuilderTextField(
                            name: 'email',
                            initialValue: 'tkjarmel@gmail.com',
                            // validator: ValidatorState.email,
                            decoration:
                            CustomInputDecoration.style1(labelText: 'Email'),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.04),

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

                        SizedBox(height: Get.height * 0.04),

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
                              "Le mot de passe doit comporter au moins 8 caractères, majuscules, minuscules et un code unique comme # % !",
                              style:TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: LightColor.black,
                              ),
                              ),),
                          ],
                        )


                      ]),
                    ),
                    SizedBox(height: Get.height * 0.04),
                    SizedBox(height: Get.height * 0.1),
                    FadeInRight(
                      duration: Duration(milliseconds: 600),
                      child: ButtonStyle1Widget(
                        text: 'Démarrer l’inscription',
                        color: LightColor.second,
                        onPressed: () => Get.toNamed(AppRoutes.REGISTER_OTP),
                      ),
                    ),
                  ],
                ),
              ),
        ));
  }
}
