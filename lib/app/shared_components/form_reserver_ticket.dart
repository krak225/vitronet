
import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cinetpay/cinetpay.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:hello_depart/app/constans/app_color.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../config/app_constants.dart';
import '../constans/app_constants.dart';
import '../features/dashboard/controllers/home_controller.dart';
import '../features/dashboard/controllers/dashboard_controller.dart';
import '../features/dashboard/model/facture.dart';
import '../features/dashboard/model/hellodepart_models.dart';
import '../utils/stdfn.dart';
import '../utils/ui/theme/custom_input_decoration.dart';
import '../utils/ui/theme/light_color.dart';
import '../utils/validator_state.dart';

class FormReserverTicket extends StatelessWidget {
  final DashboardController controller = Get.find();
  final HomeController hcontroller = Get.find();
  final Depart depart;
  String entered_code = '';
  TextEditingController nombre_ticket_controller = new TextEditingController();

  FormReserverTicket(this.depart, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var tickets_achetes = (depart!.departNbreTicketAchete != null)? depart!.departNbreTicketAchete : 0;

    var texte_tickets_restants = (depart!.departCapacitevehicule! - tickets_achetes!).toString()+"/"+depart!.departCapacitevehicule.toString();

    var nombre_tickets_restants = int.parse((depart!.departCapacitevehicule! - tickets_achetes!).toString());

    controller.nombre_ticket = 1.obs;

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
                                    "Réservation de tickets",
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
                                  SizedBox(
                                    width: 0,
                                    height: 0,
                                    child: FormBuilderTextField(
                                      name: 'depart_id',
                                      initialValue: depart.departId.toString(),
                                      validator: ValidatorState.required
                                    ),
                                  ),
                                  FadeInRight(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: FadeInRight(
                                            child: Text("N° départ: ", style:TextStyle(fontSize: 12),),
                                          ),
                                        ),
                                        Expanded(
                                            child:Text(depart!.departId.toString(), textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),)
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
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          child: FadeInRight(
                                              child: Text(Stdfn.dateFromDB(depart!.departDatePrevue!), textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),)
                                          ),
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
                                            child: Text("Heure : ", style:TextStyle(fontSize: 12),),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          child: FadeInRight(
                                              child: Text(depart!.departHeurePrevue!.substring(0,5), textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),)
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(height: 1, color: Colors.grey[100],),
                                  SizedBox(height: Get.height * 0.01),
                                  FadeInRight(
                                    child: Row(
                                      children: [
                                        FadeInRight(
                                          child: Text("Ligne: ", style:TextStyle(fontSize: 12),),
                                        ),
                                        Expanded(
                                            child:Text(depart!.ligne!.ligneDesignation!, textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),)
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(height: 1, color: Colors.grey[100],),
                                  SizedBox(height: Get.height * 0.01),
                                  FadeInRight(
                                    child: Row(
                                      children: [
                                        FadeInRight(
                                          child: Text("Compagnie: ", style:TextStyle(fontSize: 12),),
                                        ),
                                        Expanded(
                                            child:Text(depart!.compagnie!.compagnieDesignation!, textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),)
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(height: 1, color: Colors.grey[100],),
                                  SizedBox(height: Get.height * 0.01),
                                  FadeInRight(
                                    child: Row(
                                      children: [
                                        FadeInRight(
                                          child: Text("Gare: ", style:TextStyle(fontSize: 12),),
                                        ),
                                        Expanded(
                                            child:Text(depart!.gare!.gareDesignation!, textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),)
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
                                            child: Text("Tarif: ", style:TextStyle(fontSize: 12),),
                                          ),
                                        ),
                                        Expanded(
                                            child:Text(depart!.departTarif.toString() + " FCFA", textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),)
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
                                            child: Text("Tickets restants: ", style:TextStyle(fontSize: 12),),
                                          ),
                                        ),
                                        Expanded(
                                            child:Text(texte_tickets_restants, textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),)
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(height: 1, color: Colors.grey[100],),
                                  SizedBox(height: Get.height * 0.01),
                                  FadeInRight(
                                    child: FormBuilderTextField(
                                      name: 'client',
                                      textCapitalization: TextCapitalization.characters,
                                      initialValue: "",
                                      decoration: CustomInputDecoration.style1(labelText: 'Nom du client'),
                                    ),
                                  ),
                                  Divider(height: 1, color: Colors.grey[100],),
                                  SizedBox(height: Get.height * 0.01),
                                  FadeInRight(
                                    child: FormBuilderTextField(
                                      name: 'telephone',
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 2.0,),
                                      //maxLength: 10,
                                      keyboardType: TextInputType.number,
                                      initialValue: "",
                                      decoration: CustomInputDecoration.style1(labelText: 'Téléphone'),
                                    ),
                                  ),
                                  Divider(height: 1, color: Colors.grey[100],),
                                  SizedBox(height: Get.height * 0.02),
                                  FadeInRight(
                                    child:Text("Nombre de tickets", style: const TextStyle(fontSize: 12,),textAlign: TextAlign.left,),
                                  ),
                                  FadeInRight(
                                    child:Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children:[
                                        IconButton(onPressed: ()=> controller.decrementNombreTicket(), icon: Icon(EvaIcons.minusSquareOutline, color: AppColor.kPrimaryColor, size: 32,)),
                                        ClipRRect(
                                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                                            color: AppColor.kPrimaryColor.withOpacity(.7),
                                            child:Text(controller.nombre_ticket.value.toString(),
                                              style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                            textAlign: TextAlign.right,
                                          ),
                                          ),
                                        ),
                                        IconButton(onPressed: ()=> controller.incrementNombreTicket(nombre_tickets_restants), icon: Icon(EvaIcons.plusSquareOutline, color: AppColor.kPrimaryColor, size: 32,)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: Get.height * 0.02),
                                  FadeInRight(
                                    child: Divider(height: 4, color: AppColor.kPrimaryColor,),
                                  ),
                                  SizedBox(height: Get.height * 0.01),
                                  FadeInRight(
                                    child: _buildTotalFacture(),
                                  ),
                                ]),
                                ),
                              ),
                            ]),
                      ),
                    ),
                    Divider(),
                    Container(padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Column(children:[
                          FadeInRight(
                            duration: Duration(milliseconds: 600),
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                onPressed: () => controller.payerTicket(),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  backgroundColor: AppColor.kAccentColor,
                                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                ),
                                icon: controller.isLoading.value ? Container(
                                  width: 24,
                                  height: 24,
                                  padding: const EdgeInsets.all(2.0),
                                  child: const CircularProgressIndicator(
                                    color: Colors.black,
                                    strokeWidth: 3,
                                  ),
                                )
                                    : const Icon(Icons.monetization_on_outlined, color: Colors.black,),
                                label: const Text('PASSER AU PAIEMENT', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ]),
                    )
            ]),
          ),
          ),
        ])
    );

  }


  Widget _buildTotalFacture() {

    return ListTile(
      contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
      leading: null,
      title: Text("Montant à payer",style: const TextStyle(fontWeight: FontWeight.normal), maxLines: 1,overflow: TextOverflow.ellipsis),
      trailing: Tooltip(
          message: "Montant à payer",
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
              color: AppColor.kPrimaryColor.withOpacity(1),
              child:Text(
                Stdfn.toAmount(int.parse(depart!.departTarif.toString()) * controller.nombre_ticket.value),
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
