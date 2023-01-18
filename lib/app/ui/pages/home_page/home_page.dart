
import '../../global_widgets/item_box_widget.dart';
import '../../global_widgets/search_box_widget.dart';
import '../../layouts/main/widgets/main_layout_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return MainLayoutView(
        hPadding: 30,
        // backgroundColors: LightColor.backgroundHome,
        child: Column(children: [
          SearchBoxWidget(),
          SizedBox(
            height: 40,
          ),
          ItemBoxWidget(
            title: "Déposer votre CV",
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
            title: "Recherche un job Pour le Candidat",
            icon: "assets/images/portfolio2.png",
            onTap: () => null,
          ),
        ]));
  }
}
