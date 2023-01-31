import 'package:auto_size_text/auto_size_text.dart';
import 'package:job_boarder/app/ui/global_widgets/search_box_widget.dart';
import 'package:job_boarder/app/ui/theme/light_color.dart';

import '../../../data/models/offre.dart';
import '../../../routes/app_routes.dart';
import '../../global_widgets/button_style1_widget.dart';
import '../../global_widgets/item_box_widget.dart';
import '../../layouts/main/widgets/main_layout_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/comment_controller.dart';
import '../home_page/widgets/home_header_box_widget.dart';
import 'widgets/comment_header_box_widget.dart';


class CommentPage extends GetView<CommentController> {
  @override
  Widget build(BuildContext context) {

    return MainLayoutView(
        hPadding: 0,
        child: Column(
          children: [
            SizedBox(height:0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SearchBoxWidget(),
            ),
            //CommentHeaderBoxWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    "Offres populaires",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                  ),

                  TextButton(
                    onPressed: () {},
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
            /*Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child:FutureBuilder<List<Comment>>(
                  future: controller.fetchComments(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Comment>? comments = snapshot.data;

                      return ListView(
                        scrollDirection: Axis.vertical,
                        children:
                        List.generate(
                          comments!.length,
                              (index) =>
                              ItemBoxWidget(
                                  title: comments[index].offretitre,
                                  icon: "assets/images/depocv.png",
                                  onTap: () => null,
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
            ),*/

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/images/orange-3 1.png"),
                        SizedBox(
                          width: 50,
                        ),
                        Expanded(
                            child: Column(
                              children: [
                                AutoSizeText(
                                  "UI DESIGNER H/F",
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                                ),
                                AutoSizeText(
                                  "ORANGE NIGER",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey),
                                ),
                              ],
                            )
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Voir le détail",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
                    ),
                  ],
                ),
              ),
            ),

            /*
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ItemBoxWidget(
                title: "UX/UI Designer, Niger, Niamey",
                icon: "assets/images/orange-3 1.png",
                onTap: () => null,
              ),
            ),
            */

            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    "Récemment publié",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                    ),
                    maxLines: 1,
                  ),

                  TextButton(
                    onPressed: () {},
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
            Expanded(
              child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child:FutureBuilder<List<Comment>>(
                    future: controller.fetchComments(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                          List<Comment>? comments = snapshot.data;

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
