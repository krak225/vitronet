
import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../config/app_constants.dart';
import '../constans/app_color.dart';
import '../constans/app_constants.dart';
import '../features/dashboard/controllers/home_controller.dart';
import '../features/dashboard/controllers/dashboard_controller.dart';
import '../features/dashboard/model/evenement.dart';
import '../utils/stdfn.dart';

class DetailsEvenement extends StatelessWidget {
  final DashboardController controller = Get.find();
  final HomeController hcontroller = Get.find();
  final Evenement evenement;

  DetailsEvenement(this.evenement, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 15,
            width: 120,
            child:LinearPercentIndicator(
              percent: 1 / 1,
              progressColor: Colors.white70,
              //backgroundColor: Colors.blueGrey[200],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12), ),
            child:
            Container(
              color: Colors.white,
              child: Column(
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(top: 30, right: 30, bottom: 0, left: 30),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  AutoSizeText(
                                    evenement!.evenementLibelle.toString() ,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                              FormBuilder(
                                key: controller.formKey,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Obx(()=>Column(children: [
                                  Center(child: controller.isLoading.value? null : null),//juste pour pouvoir utiliser obx en attentant de voir
                                  SizedBox(height: 20),
                                  FadeInRight(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: FadeInRight(
                                            child: Text("Date : ", style:TextStyle(fontSize: 12),),
                                          ),
                                        ),
                                        Expanded(
                                            child: Text(Stdfn.dateFromDB(evenement!.evenementDate!), textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),)
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(height: 1, color: Colors.grey[100],),
                                  SizedBox(height: Get.height * 0.01),
                                  FadeInRight(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: FadeInRight(
                                            child: Text("Nombre total tickets : ", style:TextStyle(fontSize: 12),),
                                          ),
                                        ),
                                        Expanded(
                                            child: Text(Stdfn.toAmount(evenement!.evenementNombreTotalTickets!), textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),)
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(height: 1, color: Colors.grey[100],),
                                  SizedBox(height: Get.height * 0.01),
                                  FadeInRight(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: FadeInRight(
                                            child: Text("Nombre tickets vérifiés : ", style:TextStyle(fontSize: 12),),
                                          ),
                                        ),
                                        Expanded(
                                            child: Text(Stdfn.toAmount(evenement!.evenementNombreTicketsVerifies!), textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),)
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(height: 1, color: Colors.grey[100],),
                                  SizedBox(height: Get.height * 0.01),
                                  FadeInRight(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: FadeInRight(
                                            child: Text("Nombre tickets restants : ", style:TextStyle(fontSize: 12),),
                                          ),
                                        ),
                                        Expanded(
                                            child: Text(Stdfn.toAmount(evenement!.evenementNombreTicketsNonVerifies!), textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),)
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(height: 1, color: Colors.grey[100],),
                                  SizedBox(height: Get.height * 0.01),
                                  FadeInRight(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: FadeInRight(
                                            child: Text("Date création : ", style:TextStyle(fontSize: 12),),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          child: FadeInRight(
                                              child: Text(Stdfn.dateTimeFromDB(evenement!.evenementDateCreation!), textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),)
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(height: 1, color: Colors.grey[100],),
                                  SizedBox(height: Get.height * 0.01),
                                  /*FadeInRight(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: FadeInRight(
                                            child: Text("Statut: ", style:TextStyle(fontSize: 12),),
                                          ),
                                        ),
                                        Expanded(
                                            child: Text(evenement!.evenementStatut!, textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),)
                                        ),
                                      ],
                                    ),
                                  ),*/
                                  /*Divider(height: 1, color: Colors.grey[100],),
                                  SizedBox(height: Get.height * 0.01),
                                  FadeInRight(
                                    child: FadeInRight(
                                      child: _buildTotalFacture(),
                                    ),
                                  ),*/
                                  SizedBox(height: Get.height * 0.1),
                                ]),
                                ),
                              ),
                            ]),
                      ),
                    ),
            ]),
          ),
          ),
        ])
    );

  }


  Widget _buildIcon(String photo_url) {

    print(photo_url);

    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blueGrey.withOpacity(.1),
      ),
      child: FadeInImage(
        fadeInDuration: const Duration(milliseconds: 1),
        image:NetworkImage(AppConstants.PRODUCTS_URL + photo_url),
        placeholder: const AssetImage('assets/icons/user_.png'),
        imageErrorBuilder:(context, error, stackTrace) {
          return Icon(EvaIcons.person);
        },
        fit: BoxFit.contain,
      ),
    );
  }


  Widget _buildAssign(int total) {
    return Tooltip(
        message: total.toString(),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          child: Container(
            //width: 50.0,
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            color: Colors.green.withOpacity(.7),
            child:Text(
              Stdfn.toAmount(total),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        )
    );

  }

  Widget _buildTotalFacture() {

    return ListTile(
      contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
      leading: null,
      title: Text("Montant",style: const TextStyle(fontWeight: FontWeight.normal), maxLines: 1,overflow: TextOverflow.ellipsis),
      trailing: Tooltip(
          message: "Montant",
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
              color: AppColor.kPrimaryColor.withOpacity(.7),
              child:Text(
                Stdfn.toAmount(int.parse(evenement!.evenementId.toString())),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          )
      ),
      hoverColor: AppColor.kPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
    );
  }
}
