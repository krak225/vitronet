import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../config/app_constants.dart';
import '../../../../routes/app_routes.dart';
import '../../../global_widgets/button_style1_widget.dart';
import '../../../theme/light_color.dart';

class ProfilBoxWidget extends StatelessWidget {
  const ProfilBoxWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    GetStorage _storage = GetStorage();
    String email = _storage.read(AppConstants.USER_EMAIL).toString();
    String firstname = _storage.read(AppConstants.USER_FIRSTNAME).toString();
    String lastname = _storage.read(AppConstants.USER_LASTNAME).toString();

    return Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Color(0xff111111).withOpacity(0.05),
                  spreadRadius: 10,
                  blurRadius: 15,
                  offset: Offset(0, 0))
            ],
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/profil2.png',
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        firstname + " " + lastname,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: LightColor.primary),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      AutoSizeText(
                        email,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: LightColor.grey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        decoration: BoxDecoration(
                            color:
                            LightColor.second.withOpacity(0.9),
                            borderRadius:
                            BorderRadius.circular(14)),
                        child: AutoSizeText(
                          'Vérifié',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ButtonStyle1Widget(
              text: 'Modifier le compte',
              color: LightColor.second,
              height: 40,
              onPressed: () => Get.toNamed(AppRoutes.PROFIL_UPDATE),
            )
          ],
        ));
  }
}
