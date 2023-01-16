import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:job_boarder/app/routes/app_routes.dart';

import '../../global_widgets/button_style1_widget.dart';
import '../../layouts/main/widgets/main_layout_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/login_controller.dart';
import '../../theme/custom_input_decoration.dart';
import '../../theme/light_color.dart';
import '../../utils/validator_state.dart';
import 'widgets/social_buttom_widget.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return MainLayoutView(
        hPadding: 30,
        child: Obx(
          () => SingleChildScrollView(
              child: Container(
            width: Get.width,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Get.height * 0.07,
                  ),
                  Image.asset(
                    'assets/images/logo.jpg',
                    width: Get.width * 0.25,
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  AutoSizeText(
                    "Connexion candidat",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  FormBuilder(
                    key: controller.formKey,
                    ///initialValue: controller.initValues,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(children: [
                      FadeInRight(
                        child: FormBuilderTextField(
                          name: 'email',
                          initialValue: '',
                          validator: ValidatorState.email,
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
                      SizedBox(height: Get.height * 0.02),
                      FadeInRight(
                        duration: Duration(milliseconds: 600),
                        child: ButtonStyle1Widget(
                          text: 'Continuer',
                          onPressed: () => controller.login(),
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  TextButton(onPressed: () => null, child: AutoSizeText(
                    "Mot de passe oublié ?",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: LightColor.second,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  )),

                  SizedBox(
                    height: Get.height * 0.03,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: LightColor.grey,
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
                          color: LightColor.grey,
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
                    height: Get.height * 0.02,
                  ),

                  FadeInRight(
                    duration: Duration(milliseconds: 900),
                    child: SocialButtomWidget(
                      text: 'Continuer avec Google',
                      icon: 'google.png',
                      onPressed: () => null,
                    ),
                  ),

                  FadeInRight(
                    duration: Duration(milliseconds: 900),
                    child: SocialButtomWidget(
                      text: 'Continuer avec Apple',
                      icon: 'apple.png',
                      onPressed: () => null,
                    ),
                  ),

                  FadeInRight(
                    duration: Duration(milliseconds: 900),
                    child: SocialButtomWidget(
                      text: 'Continuer avec Facebook',
                      icon: 'facebook.png',
                      onPressed: () => null,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),

                  AutoSizeText.rich(
                    TextSpan(
                      text: "Première connexion ? ",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: LightColor.grey,
                      ),
                      children: [
                        TextSpan(
                          text: "Créer un compte",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: LightColor.second,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(AppRoutes.REGISTER_INIT);
                            },
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),




                ]),
          )),
        ));
  }
}
