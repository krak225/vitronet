import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:job_boarder/app/controllers/main_controller.dart';
import 'package:job_boarder/app/ui/global_widgets/search_box_widget.dart';
import 'package:job_boarder/app/ui/theme/light_color.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../../../data/models/offre.dart';
import '../../../routes/app_routes.dart';
import '../../global_widgets/button_style1_widget.dart';
import '../../layouts/main/widgets/main_layout_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/comment_controller.dart';
import '../../theme/custom_input_decoration.dart';
import '../../utils/validator_state.dart';

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
                      Get.bottomSheet(
                        Container(
                          decoration: BoxDecoration(
                            color: LightColor.second,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff000000).withOpacity(0.11),
                                spreadRadius: 1,
                                blurRadius: 30,
                                offset: Offset(0, 20), // changes position of shadow
                              ),
                            ],
                          ),
                          height: 350,
                          color: Colors.white,
                          child:FormBuilder(
                            key: controller.formKey,
                            ///initialValue: controller.initValues,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Column(children: [
                              FadeInRight(
                                child: FormBuilderTextField(
                                  name: 'diplome',
                                  initialValue: '',
                                  decoration:
                                  CustomInputDecoration.style1(labelText: 'Diplôme requis'),
                                ),
                              ),
                              SizedBox(height: Get.height * 0.02),
                              FadeInRight(
                                delay: Duration(milliseconds: 300),
                                child: FormBuilderTextField(
                                  name: 'domaine',
                                  initialValue: '',
                                  obscureText: controller.isHide.value,
                                  validator: ValidatorState.required,
                                  decoration: CustomInputDecoration.style1(
                                      labelText: "Secteur d'activité",
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          Icons.remove_red_eye_outlined,
                                          color: Colors.black,
                                        ),
                                        onPressed: () {
                                          controller.isHide.value =
                                          !controller.isHide.value;
                                        },
                                      )),
                                ),
                              ),
                              SizedBox(height: Get.height * 0.02),
                              FadeInRight(
                                duration: Duration(milliseconds: 600),
                                child: ButtonStyle1Widget(
                                  text: 'Continuer',
                                  onPressed: () => {print("search performed")},
                                ),
                              ),
                            ]),
                          ),
                          ),
                          barrierColor: Colors.grey[3],
                          isDismissible: true,
                        )
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
                        onPressed: () => controller.changeIndex(1),//Get.toNamed(AppRoutes.OFFRES, arguments: 1),
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
                    future: controller.fetchComments(1.toString()),
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
                                    onTap: () => Get.toNamed(AppRoutes.DETAILS_OFFRE, arguments: comments1[index]),
                                    child: Container(
                                      child: Row(
                                        children: [
                                        //Image.asset("assets/images/orange-3 1.png"),
                                        Image.network(comments1[index].offre_image, width: 80, height: 70,),
                                        SizedBox(width: 5),
                                        Column(children: [
                                          AutoSizeText(
                                            comments1[index].offretitre,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                                          ),
                                          AutoSizeText(
                                            comments1[index].entreprise,
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
