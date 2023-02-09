
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_boarder/app/ui/pages/home_page/widgets/home_header_box_widget.dart';

import '../../../controllers/main_controller.dart';
import '../../../routes/app_routes.dart';
import '../../global_widgets/item_box_widget.dart';
import '../../layouts/main/widgets/main_layout_view.dart';

class HomePage extends GetView<MainController> {

  @override
  Widget build(BuildContext context) {
    return MainLayoutView(
        hPadding: 0,
        // backgroundColors: LightColor.backgroundHome,
        child:
        SingleChildScrollView(
        child: Column(children: [
          //SearchBoxWidget(),
          HomeHeaderBoxWidget(),
          SizedBox(
            height: 0,
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child:Column(
                  children: [
                    ItemBoxWidget(
                      title: "CV et autres documents",
                      icon: "assets/images/depocv.png",
                      onTap: () => Get.toNamed(AppRoutes.MES_DOCUMENTS),
                    ),
                    SizedBox(height: 20,),
                    ItemBoxWidget(
                      title: "Offres selon mon profil",
                      icon: "assets/images/portfolio.png",
                      onTap: () => controller.changeIndex(3), //Get.toNamed(AppRoutes.COMMENT, arguments: 1),
                    ),
                    SizedBox(height: 20,),
                    ItemBoxWidget(
                      title: "Autres offres d'emploi",
                      icon: "assets/images/portfolio2.png",
                      onTap: () => controller.changeIndex(2),
                    ),]
              ),
            ),
        ]),
        ),
    );
  }
}
