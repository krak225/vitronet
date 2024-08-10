import 'package:animate_do/animate_do.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constans/app_color.dart';
import '../../../../constans/app_constants.dart';
import '../../../../shared_components/header_text.dart';
import '../../../../shared_components/scan_buttons.dart';
import '../../../../utils/stdfn.dart';
import '../../controllers/home_controller.dart';
import '../components/liste_tickets.dart';
class DetailsEvenementScreen extends GetView<HomeController> {
  DetailsEvenementScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _homeKey = GlobalKey<FormState>(debugLabel: '_homeScreenkey');

  @override
  Widget build(BuildContext context) {

    // Récupérer l'événement passé
    int? evenementId = int.tryParse((Get.parameters['id']) ?? '');
    String? evenementLibelle = Get.parameters['libelle'];
    String? evenementDate = Get.parameters['date'];
    String? evenementDateCreation = Get.parameters['date'];
    int? evenementNombreTotalTickets = 0;//Get.parameters['id'];
    int? evenementNombreTicketsVerifies = 0;//Get.parameters['id'];
    int? evenementNombreTicketsNonVerifies = 0;//Get.parameters['id'];

    controller.fetchTickets(evenementId!);

    return Scaffold(
      //key: _homeKey,
      //backgroundColor: AppColor.yellow.withOpacity(1),
      //key: controller.scafoldKey,
      appBar: AppBar(
        title: Column(children: [
          Container(
            width: 200,
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            decoration: BoxDecoration(
              color: AppColor.yellow,
              borderRadius: BorderRadius.circular(10,),
            ),
            child: Image.asset('assets/images/logo.png'),
          ),
        ]),
        backgroundColor: AppColor.yellow,
        centerTitle: true,
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: SingleChildScrollView(
          child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kSpacing),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      /*Row(
                        children: [
                          const HeaderText("Informations de l'événement"),
                        ],
                      ),
                      SizedBox(height: 10,),*/
                      FadeInRight(
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(evenementLibelle!, textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold),)
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
                                child: Text("Date : ", style:TextStyle(fontSize: 12),),
                              ),
                            ),
                            Expanded(
                                child: Text(Stdfn.dateFromDB(evenementDate!), textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),)
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
                                child: Text(Stdfn.toAmount(evenementNombreTotalTickets!), textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),)
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
                                child: Text(Stdfn.toAmount(evenementNombreTicketsVerifies!), textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),)
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
                                child: Text(Stdfn.toAmount(evenementNombreTicketsNonVerifies!), textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),)
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
                                  child: Text(Stdfn.dateTimeFromDB(evenementDateCreation!), textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),)
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(height: 1, color: Colors.grey[100],),
                      SizedBox(height: Get.height * 0.01),
                      const SizedBox(height: kSpacing),
                      //HeaderVerificationTickets(),
                      Row(
                        children: [
                          const HeaderText("Vérification de tickets"),
                        ],
                      ),
                      SizedBox(height: Get.height * 0.01),
                      ScanButtons(controller: controller, evenement_id: evenementId!, ),
                      const SizedBox(height: kSpacing),
                      Row(
                        children: [
                          const HeaderText("Liste des tickets"),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () => controller.fetchTickets(evenementId),
                            style: ElevatedButton.styleFrom(
                              //foregroundColor: Colors.white[850], backgroundColor: Colors.white[100],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 0,
                            ),
                            child: Icon(EvaIcons.refresh, color: AppColor.yellow,),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                      /*ListeTickets(
                        data: controller.fetchTickets(evenementId!),
                        onPressed: controller.onPressedTask,
                      ),*/
                      Obx(() {
                        // Assuming `tickets` is an observable list in your controller
                        if (controller.isLoadingTickets.value) { // Check if loading
                          return Center(child: Container(padding: EdgeInsets.symmetric(vertical: 100, horizontal: 0), child: CircularProgressIndicator())); //color: Colors.black
                        } else if (controller.liste_tickets.isEmpty) {
                          return Center(child: Container(padding: EdgeInsets.symmetric(vertical: 100, horizontal: 0), child:Text('Aucun ticket disponible.')));
                        } else {
                          return ListeTickets(
                            data: controller.liste_tickets, // Use the observable list directly
                            onPressed: controller.onPressedTask,
                          );
                        }
                      }),
                    ],
                  ),
                )

              ]
          ),
        ),
      ),
    );

  }

}
