import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
import '../../controllers/home_controller.dart';
import '../components/liste_tickets.dart';

  class VetementsScreen extends GetView<HomeController> {
  const VetementsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        controller: ScrollController(),
        child: _buildVetementsContent(
          onPressedMenu: () => controller.openDrawer(),
          context: context
        )
    );
  }

  Widget _buildVetementsContent({Function()? onPressedMenu, required BuildContext context}) {
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
                const HeaderText("Choix des vêtements"),
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
