
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/main_controller.dart';
import '../../../../routes/app_routes.dart';
import '../../../theme/light_color.dart';
import '../../../theme/themes.dart';

class SearchHeaderWidget extends StatelessWidget {
  final MainController mainController = Get.find();

  final dynamic openDrawer;
  final String title;

  SearchHeaderWidget({Key? key, this.openDrawer, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 90,
      padding: EdgeInsets.only(top: 40, right: 10, left: 0 , bottom: 10),
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () => Get.toNamed(AppRoutes.PROFIL)?.then((value) => mainController.init()),
              child: Icon(Icons.arrow_back, size: 21, color: Colors.black,),
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
            child: Center()
          ),
        ],
      ),
    );
  }
}
