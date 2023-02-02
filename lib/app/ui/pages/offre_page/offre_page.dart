import 'package:auto_size_text/auto_size_text.dart';
import 'package:job_boarder/app/ui/global_widgets/search_box_widget.dart';
import 'package:job_boarder/app/ui/theme/light_color.dart';

import '../../../controllers/offre_controller.dart';
import '../../../data/models/offre.dart';
import '../../../routes/app_routes.dart';
import '../../layouts/main/widgets/main_layout_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Animal {
  final int id;
  final String name;

  Animal({
    required this.id,
    required this.name,
  });
}

class OffrePage extends GetView<OffreController> {
  int type;
  String libelle_offres = "Liste des offres d'emploi";
  int nbre_offres = 0;
  int? q = Get.arguments;

  OffrePage(this.type, this.libelle_offres);

  @override
  Widget build(BuildContext context) {
    q ?? 0;
    q = 0;

    return MainLayoutView(
        hPadding: 0,
        child: Column(
          children: [
            SizedBox(height:0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SearchBoxWidget(
                onTapSearch: () => {
                  Get.toNamed(AppRoutes.SEARCH)
                },
                onTapSettings: () => {

                },
                comments: controller.comments,
              ),
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
                    onPressed: () => Get.toNamed(AppRoutes.COMMENT, arguments: 2),
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
                                    child: InkWell(
                                      onTap: () => Get.toNamed(AppRoutes.DETAILS_OFFRE, arguments: comments[index]),
                                      child: Row(
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
                                      ),
                                    ),
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
