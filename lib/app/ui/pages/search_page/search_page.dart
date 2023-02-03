import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_boarder/app/ui/pages/search_page/recherche_view.dart';

import '../../../controllers/search_controller.dart';
import '../../../data/models/offre.dart';
import '../../../routes/app_routes.dart';
import '../../global_widgets/default_header_widget.dart';
import '../../layouts/main/widgets/main_layout_view.dart';
import '../../theme/light_color.dart';

class SearchPage extends GetView<SearchController> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    //return RechercheView();

    controller.getOffres("");

    return Obx(()=> MainLayoutView(
      hPadding: 0,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              DefaultHeaderWidget(title: "Rechercher une offre"),
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: TextFormField(
                          controller: textEditingController,
                          onChanged: (value) {
                            controller.getOffres(value);
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.getOffres(textEditingController.text);
                                },
                                icon: Icon(Icons.search),
                              ),
                              hintText: "Rechercher l'intitulé de l'offre"),
                        ),
                      )),
                  SizedBox(width: 10,),
                  /*Container(
                      color: Colors.white,
                      child: Center(
                        child: IconButton(
                          onPressed: (){
                            textEditingController.clear();
                            controller.FactRepo.clear();
                          },
                          icon: Icon(Icons.clear,color: Colors.red,),
                        ),
                      ),
                    )*/
                ],
              ),
              SizedBox(height: 10,),
              SizedBox(height: 600,
                child: ListView.builder(
                    itemCount: controller.factModels.length,
                    itemBuilder: (BuildContext, index){

                      Comment comment = controller.factModels[index];

                      return Container(
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: [
                              BoxShadow(
                                color: LightColor.lightGrey2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child:InkWell(
                            onTap: () => Get.toNamed(AppRoutes.DETAILS_OFFRE, arguments: controller.factModels[index]),
                            child: Row(
                                children: [
                                  Image.network(comment.offre_image, width: 70, height: 70,),
                                  SizedBox(width: 5),
                                  Column(
                                    children: [
                                      Text(
                                        comment.offretitre,
                                        maxLines: 2,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                                        overflow: TextOverflow.fade,
                                      ),
                                      Text(
                                        comment.entreprise,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.grey),
                                        overflow: TextOverflow.fade,
                                      ),
                                    ],
                                  ),
                                  Image.asset("assets/images/arrow.png"),
                                ]
                            ),
                          ),
                        ),
                      );

                    }),
              )
            ],
          ),
        ),
      ),
    )
    );

  }

}