import '../../../controllers/offre_controller.dart';
import '../../global_widgets/item_box_widget.dart';
import '../../global_widgets/search_box_widget.dart';
import '../../layouts/main/widgets/main_layout_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OffrePage extends GetView<OffreController> {
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
            title: "Offre selon mon profil",
            icon: "assets/images/approved.png",
            onTap: () => null,
          ),
          SizedBox(height: 20,),
          ItemBoxWidget(
            title: "Autres Offres",
            icon: "assets/images/portfolio3.png",
            onTap: () => null,
          ),

        ]));
  }
}
