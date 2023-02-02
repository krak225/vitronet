import 'package:auto_size_text/auto_size_text.dart';
import 'package:job_boarder/app/ui/global_widgets/search_box_widget.dart';
import 'package:job_boarder/app/ui/theme/light_color.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../../../data/models/offre.dart';
import '../../../routes/app_routes.dart';
import '../../layouts/main/widgets/main_layout_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/comment_controller.dart';

class Animal {
  final int id;
  final String name;

  Animal({
    required this.id,
    required this.name,
  });
}

class CommentPage extends GetView<CommentController> {
  int type;
  String libelle_offres = "Liste des offres d'emploi";
  int nbre_offres = 0;
  int? q = Get.arguments;

  CommentPage(this.type, this.libelle_offres);

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

              Container(
                child: q == 0 ?
                Column(children: [
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
                        onPressed: () => Get.toNamed(AppRoutes.OFFRES, arguments: 1),
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
                    future: controller.fetchComments(2.toString()),
                    builder: (context, snapshot) {
                    if (snapshot.hasData) {
                    List<Comment>? comments = snapshot.data;

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
                            comments!.length,
                            (index) => Container(
                              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                              child: Container(
                              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(39),
                                boxShadow: [
                                    BoxShadow(
                                      color: LightColor.lightGrey2,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    )
                                  ],
                                ),
                                  child:InkWell(
                                    onTap: () => Get.toNamed(AppRoutes.DETAILS_OFFRE, arguments: comments[index]),
                                    child: Row(
                                      children: [
                                      //Image.asset("assets/images/orange-3 1.png"),
                                      Image.network(comments[index].offre_image, width: 80, height: 70,),
                                      SizedBox(width: 5),
                                      Column(children: [
                                        AutoSizeText(
                                          comments[index].offretitre,
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                                        ),
                                        AutoSizeText(
                                          comments[index].entreprise,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey),
                                        ),
                                        TextButton(
                                          onPressed: () => Get.toNamed(AppRoutes.DETAILS_OFFRE, arguments: comments[index]),
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
                    );

                    } else if (snapshot.hasError) {
                    return Text("Pas de données");//"${snapshot.error}"
                    }
                    return Center(child: CircularProgressIndicator());
                    },
                    ),
                  ),
                ])
                    :
                Text('')
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
                      future: controller.fetchComments(type.toString()),
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
