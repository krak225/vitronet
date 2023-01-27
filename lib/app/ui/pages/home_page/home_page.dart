
import 'package:job_boarder/app/ui/pages/home_page/widgets/home_header_box_widget.dart';

import '../../../controllers/main_controller.dart';
import '../../../routes/app_routes.dart';
import '../../global_widgets/item_box_widget.dart';
import '../../layouts/main/widgets/main_layout_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  //final MainController main_controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return MainLayoutView(
        hPadding: 0,
        // backgroundColors: LightColor.backgroundHome,
        child: Column(children: [
          //SearchBoxWidget(),
          HomeHeaderBoxWidget(),
          SizedBox(
            height: 0,
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child:
            Column(
                children: [
                  ItemBoxWidget(
                    title: "Déposer mon CV",
                    icon: "assets/images/depocv.png",
                    onTap: () => null,
                  ),
                  SizedBox(height: 20,),
                  ItemBoxWidget(
                    title: "Postuler à une offre",
                    icon: "assets/images/portfolio.png",
                    onTap: () => null,
                  ),
                  SizedBox(height: 20,),
                  ItemBoxWidget(
                    title: "Rechercher un Job",
                    icon: "assets/images/portfolio2.png",
                    onTap: () => null, //main_controller.changeIndex(2),
                  ),]
            ),
          )
        ])
    );
  }
}
