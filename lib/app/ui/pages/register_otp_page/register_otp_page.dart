import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../controllers/register_otp_controller.dart';
import '../../../routes/app_routes.dart';
import '../../global_widgets/button_style1_widget.dart';
import '../../layouts/main/widgets/main_layout_view.dart';
import '../../theme/light_color.dart';

class RegisterOtpPage extends GetView<RegisterOtpController> {
  @override
  Widget build(BuildContext context) {

    final String user_email = Get.arguments;

    return MainLayoutView(
      hPadding: 30,
            child:  SingleChildScrollView(
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
                              "OTP Verification",
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
                            text: "Nous venons de vous envoyer un code à 4 chiffres sur votre email ",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: LightColor.grey,
                            ),
                            children: [
                              TextSpan(
                                text: user_email,
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

                        OtpTextField(
                          numberOfFields: 4,
                          borderColor: LightColor.lightGrey2,
                          focusedBorderColor: LightColor.lightSecond2,
                          //styles: otpTextStyles,
                          showFieldAsBox: false,
                          borderWidth: 4.0,
                          fieldWidth: 50,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //runs when a code is typed in
                          onCodeChanged: (String code) {
                            //handle validation or checks here if necessary
                          },
                          //runs when every textfield is filled
                          onSubmit: (String verificationCode) {

                          },
                        ),


                        SizedBox(height: Get.height * 0.05),
                        FadeInRight(
                          duration: Duration(milliseconds: 600),
                          child: ButtonStyle1Widget(
                            text: 'Continuer',
                            color: LightColor.second,
                            onPressed: () => Get.toNamed(AppRoutes.HOME),
                          ),
                        ),
                        SizedBox(height: 20),

                        Container(
                          width: Get.width,
                          child: AutoSizeText.rich(
                            TextSpan(
                              text: "Vous n'avez pas reçu le code ? ",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: LightColor.grey,

                              ),
                              children: [
                                TextSpan(
                                  text: "Renvoyer le code",
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
                        ),
                      ],
                    ),
                  ),

    );
  }
}
