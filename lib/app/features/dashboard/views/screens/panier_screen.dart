import 'package:animate_do/animate_do.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:hello_depart/app/features/dashboard/controllers/evenements_controller.dart';
import 'package:hello_depart/app/features/dashboard/views/components/liste_evenements.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../constans/app_color.dart';
import '../../../../constans/app_constants.dart';
import '../../../../shared_components/form_recherche_ticket.dart';
import '../../../../shared_components/header_text.dart';
import '../../../../utils/stdfn.dart';
import '../../controllers/home_controller.dart';
import '../components/liste_tickets.dart';

  class PanierScreen extends GetView<HomeController> {
  const PanierScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        //verticalDirection: VerticalDirection.down,
        children: [
          Container(
            height: 570,
            child: SingleChildScrollView(
              controller: ScrollController(),
              child: _buildPanierContent(
                onPressedMenu: () => controller.openDrawer(),
                context: context
              ),
            ),
          ),
          Divider(height: 1, color: Colors.grey[100],),
          Container(
              color: AppColor.white,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Column(children: [
                SizedBox(height: Get.height * 0.01),
                FadeInRight(
                  child: Row(
                    children: [
                      Expanded(
                        child: FadeInRight(
                          child: Text("Montant total: ", style:TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.blueGrey),),
                        ),
                      ),
                      Tooltip(
                        message: "5 400",
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          child: Container(
                            //width: 50.0,
                            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                            color: AppColor.primaryDarkColor,
                            child:Text(
                              Stdfn.toAmount(int.parse("19200"))+" F",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Get.height * 0.02),
                FadeInRight(
                  duration: Duration(milliseconds: 600),
                  child: Center(child: ElevatedButton.icon(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: AppColor.AccentColor, //padding: const EdgeInsets.symmetric(horizontal: , vertical: 0),
                    ),
                    icon: controller.isLoading.value ? Container(
                      width: 24,
                      height: 24,
                      padding: const EdgeInsets.all(2.0),
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 3,
                      ),
                    )
                        : const Icon(Icons.monetization_on),
                    label: const Text('Passer à la caisse'),
                  ),
                  ),
                ),
              ],)
          ),
        ]),
    );
  }

  Widget _buildPanierContent({Function()? onPressedMenu, required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Divider(height: 1, color: Colors.grey[100],),
            SizedBox(height: Get.height * 0.01),
            const SizedBox(height: kSpacing),
            Row(
              children: [
                const HeaderText("Mon panier à linge"),
                const Spacer(),
                ElevatedButton(
                  onPressed: () => controller.fetchTickets(1),
                  style: ElevatedButton.styleFrom(
                    //foregroundColor: Colors.white[850], backgroundColor: Colors.white[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 0,
                  ),
                  child: Icon(EvaIcons.refresh, color: Colors.black,),
                ),
                ElevatedButton(
                  onPressed: () => //controller.fetchTickets(evenementId),
                  {
                    showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {

                          return FormRechercheTicket(evenement_id: 1, onVerificationSuccess: () {  },);

                        }
                    )
                  },
                  style: ElevatedButton.styleFrom(
                    //foregroundColor: Colors.white[850], backgroundColor: Colors.white[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 0,
                  ),
                  child: Icon(EvaIcons.search, color: AppColor.yellow,),
                ),
                const SizedBox(width: 10),
              ],
            ),
            Obx(() {
              // Assuming `tickets` is an observable list in your controller
              if (controller.isLoadingTickets.value) { // Check if loading
                return Center(child: Container(padding: EdgeInsets.symmetric(vertical: 100, horizontal: 0), child: CircularProgressIndicator())); //color: Colors.black
              } else if (controller.liste_tickets.isEmpty) {
                return Center(child: Container(padding: EdgeInsets.symmetric(vertical: 100, horizontal: 0), child:Text('Aucun vêtement disponible.')));
              } else {
                return ListeTickets(
                  data: controller.liste_tickets, // Use the observable list directly
                  onPressed: controller.onPressedTask,
                );
              }
            }),
          ],
        ),
      );
  }

}
