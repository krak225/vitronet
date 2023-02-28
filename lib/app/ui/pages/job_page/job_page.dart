import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:job_boarder/app/ui/global_widgets/search_box_widget.dart';
import 'package:job_boarder/app/ui/theme/light_color.dart';

import '../../../controllers/job_controller.dart';
import '../../../controllers/main_controller.dart';
import '../../../data/models/offre.dart';
import '../../../routes/app_routes.dart';
import '../../global_widgets/button_style1_widget.dart';
import '../../layouts/main/widgets/config_alert_emploi_widget.dart';
import '../../layouts/main/widgets/main_layout_view.dart';
import '../../theme/custom_input_decoration.dart';
import '../../utils/validator_state.dart';


class JobPage extends GetView<JobController> {
  int type;
  String libelle_offres = "Liste des offres d'emploi ";
  int nbre_offres = 0;

  JobPage(this.type, this.libelle_offres);

  @override
  Widget build(BuildContext context) {

    return MainLayoutView(
        hPadding: 0,
        child: Column(
            children: [
              SizedBox(height:0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SearchBoxWidget(
                    onTapSearch: () => {
                      Get.toNamed(AppRoutes.SEARCH),
                    },
                    onTapSettings: () => {

                      Get.bottomSheet(
                        ConfiAlertEmploiWidget(),
                        barrierColor: Colors.grey[3],
                        isDismissible: true,
                      )

                    },
                    comments: controller.comments,
                ),
              ),

              Container(
                child: Column(children: [
                  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        "Offres selon mon profil ",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                        maxLines: 1,
                      ),

                      TextButton(
                        onPressed: () => controller.changeIndex(3),
                        child: AutoSizeText(
                          "Voir plus",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                    child:FutureBuilder<List<Comment>>(
                    future: controller.fetchOffres(1.toString()),
                    builder: (context, snapshot_1) {
                    if (snapshot_1.hasData) {
                    List<Comment>? comments1 = snapshot_1.data;

                    return Padding(
                      padding: EdgeInsets.only(
                        left: 16,
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                          children: List.generate(
                            comments1!.length,
                            (index) => Container(
                              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                              child: Container(
                              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                    BoxShadow(
                                      color: LightColor.lightGrey2,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    )
                                  ],
                                ),
                                  child:InkWell(
                                    onTap: () => Get.toNamed(AppRoutes.DETAILS_OFFRE, arguments: comments1[index]),
                                    child: Container(
                                      child: Row(
                                        children: [
                                        Image.network(comments1[index].offre_image, width: 60, height: 60,),
                                        SizedBox(width: 5),
                                        Column(children: [
                                          AutoSizeText(
                                            comments1[index].offretitre,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                                          ),
                                          AutoSizeText(
                                            comments1[index].diplome,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey),
                                          ),
                                          TextButton(
                                            onPressed: () => Get.toNamed(AppRoutes.DETAILS_OFFRE, arguments: comments1[index]),
                                            child: Text(
                                              "Voir le détail",
                                              style: TextStyle(
                                              color: Colors.white,
                                            ),
                                            ),
                                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
                                          ),
                                        ],
                                        )
                                      ]),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );

                    } else if (snapshot_1.hasError) {
                      return Text("AUCUNE OFFRE DISPONIBLE");//"${snapshot.error}"
                    }
                    return Center(child: CircularProgressIndicator());
                    },
                    ),
                  ),
                ])
              ),


              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText(
                      "${libelle_offres}",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                      ),
                      maxLines: 1,
                    ),

                    TextButton(
                      onPressed: () => controller.changeIndex(2),
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            shape: BoxShape.circle
                        ),
                        child: AutoSizeText(
                          "$nbre_offres",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child:FutureBuilder<List<Comment>>(
                      future: controller.fetchOffres(type.toString()),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                            List<Comment>? comments = snapshot.data;
                            nbre_offres = comments!.length;

                            return ListView(
                              children:
                                List.generate(
                                  comments!.length,
                                      (index) =>
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
                                              child:Padding(
                                                padding: const EdgeInsets.all(0.0),
                                                child: ListTile(
                                                            minLeadingWidth: 70,
                                                            leading: Image.network(comments[index].offre_image, width: 35, ),
                                                            title: AutoSizeText(comments[index].offretitre,maxLines: 2,),
                                                            subtitle: AutoSizeText(comments[index].diplome, maxLines: 1,),
                                                            trailing:Image.asset("assets/images/arrow.png"),
                                                            onTap: () {
                                                              Get.toNamed(AppRoutes.DETAILS_OFFRE, arguments: comments[index]);
                                                            },
                                                          ),
                                                  /*
                                                  Row(
                                                    children: [
                                                      Image.network(comments[index].offre_image, width: 50, height: 40,),
                                                      SizedBox(
                                                        width: 15,
                                                      ),
                                                      Expanded(
                                                          child: AutoSizeText(
                                                            comments[index].offretitre,
                                                            maxLines: 2,
                                                           )
                                                      ),
                                                      Image.asset("assets/images/arrow.png"),
                                                    ],
                                                ),*/
                                            ),
                                        ),
                                      ),
                                ),
                            );

                          } else if (snapshot.hasError) {
                          print("${snapshot.error}");
                            return Text("Pas de données");//"${snapshot.error}"
                          }
                          return Center(child: CircularProgressIndicator());
                        },
                    ),
                ),
              ),
            ],
        )
    );
  }
}
