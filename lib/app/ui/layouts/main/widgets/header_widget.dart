
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../controllers/main_controller.dart';
import '../../../../routes/app_routes.dart';
import '../../../theme/light_color.dart';
import '../../../theme/themes.dart';

class HeaderWidget extends StatelessWidget {
  final MainController mainController = Get.find();

  final dynamic openDrawer;

  HeaderWidget({Key? key, this.openDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 90,
      padding: EdgeInsets.only(top: 30, right: 10, left: 10 , bottom: 10),
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () => openDrawer,
            child: Obx(
              () => Container(
                width: Get.width * 0.6,
                  height: 55,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(33),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xff1A181612),
                          offset: Offset(0, 10),
                          blurRadius: 15)
                    ],
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: mainController.getAvatar(20),
                        backgroundColor: LightColor.lightGrey2,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              'Bienvenue',
                              style: Themes.globalFont(
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    color: LightColor.titleTextColor,
                                  )),
                            ),
                            AutoSizeText(
                              '',
                              maxLines: 1,
                              style: Themes.globalFont(
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: LightColor.titleTextColor,
                                  )),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
              ),
            ),
          ),

          TextButton(
            onPressed: () => Get.toNamed(AppRoutes.PROFIL),
            child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xff1A181612),
                        offset: Offset(0, 10),
                        blurRadius: 15)
                  ],
                ),
                child: SvgPicture.asset(
                  'assets/icons/messaging_icon.svg',
                  width: 16,
                )),
          )
        ],
      ),
    );
  }
}
