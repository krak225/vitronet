
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/main_controller.dart';
import '../../../../routes/app_routes.dart';
import '../../../theme/light_color.dart';
import '../../../theme/themes.dart';

class Header2Widget extends StatelessWidget {
  final MainController mainController = Get.find();

  final dynamic openDrawer;
  final String title;

  Header2Widget({Key? key, this.openDrawer, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 90,
      padding: EdgeInsets.only(top: 40, right: 10, left: 10 , bottom: 10),
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              child: Image.asset(
                'assets/icons/menu.png',
                width: 54,
              ),
            ),
          ),

          Expanded(
            flex: 5,
            child: AutoSizeText(title,
                textAlign: TextAlign.center,
                style: Themes.globalFont(
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: LightColor.black,
                    ))),
          ),

          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () => Get.toNamed(AppRoutes.PROFIL)?.then((value) => mainController.init()),
              child: GetBuilder<MainController>(
                builder: (_) {
                  return mainController.getAvatar(16);
                },
              ),
              /*CircleAvatar(
                radius: 16,
                backgroundImage: mainController.getAvatar(),
                backgroundColor: LightColor.lightGrey2,
              ),*/
            ),
          ),
        ],
      ),
    );
  }
}
