import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                child: ListView.separated(
                    separatorBuilder: (context, index) { // <-- SEE HERE
                      return Divider();
                    },
                    itemCount: controller.factModels.length,
                    itemBuilder: (BuildContext, index){

                      Comment comment = controller.factModels[index];

                      return InkWell(
                        onTap: () => Get.toNamed(AppRoutes.DETAILS_OFFRE, arguments: comment),
                        child:ListTile(
                            leading: Image.network(comment.offre_image, width: 50,),
                            title: Text(
                              comment.offretitre,
                            ),
                            subtitle: Text(
                              comment.entreprise,
                            ),
                            trailing: Image.asset("assets/images/arrow.png"),
                          )
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