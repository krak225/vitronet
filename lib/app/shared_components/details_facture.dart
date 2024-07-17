
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
import '../features/dashboard/model/facture.dart';
import '../utils/stdfn.dart';
import '../utils/ui/theme/custom_input_decoration.dart';
import '../utils/ui/theme/light_color.dart';
import '../utils/ui/theme/themes.dart';
import '../utils/validator_state.dart';

class DetailsFacture extends StatelessWidget {
  final DashboardController controller = Get.find();
  final HomeController hcontroller = Get.find();
  final Facture facture;

  DetailsFacture(this.facture, {Key? key}) : super(key: key);

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
                                    "Réservation N°" + facture!.factureNumero.toString() ,
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
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          child: FadeInRight(
                                              child: Text(Stdfn.dateFromDB(facture!.factureDateCreation!), textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),)
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
                                            child: Text("Nom du client: ", style:TextStyle(fontSize: 12),),
                                          ),
                                        ),
                                        Expanded(
                                            child:Text(facture.factureNomprenomspassager.toString()?? '', textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),)
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
                                            child: Text("Téléphone: ", style:TextStyle(fontSize: 12),),
                                          ),
                                        ),
                                        Expanded(
                                            child:Text(facture.factureMobilepassager.toString() ?? '', textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),)
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
                                            child: Text("Compagnie: ", style:TextStyle(fontSize: 12),),
                                          ),
                                        ),
                                        Expanded(
                                            child:Text(facture.depart!.compagnie!.compagnieDesignation.toString(), textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),)
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
                                            child: Text("Ligne: ", style:TextStyle(fontSize: 12),),
                                          ),
                                        ),
                                        Expanded(
                                            child:Text(facture.depart?.ligne?.ligneDesignation?.toString() ?? '', textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),)
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
                                            child: Text("Nombre tickets: ", style:TextStyle(fontSize: 12),),
                                          ),
                                        ),
                                        Expanded(
                                            child:Text(facture!.factureNbrTicket.toString()!, textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),)
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
                                            child: Text("Ma commission: ", style:TextStyle(fontSize: 12),),
                                          ),
                                        ),
                                        Expanded(
                                            child:Text(facture!.facturePartpdv.toString()!, textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),)
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
                                            child: Text("Statut: ", style:TextStyle(fontSize: 12),),
                                          ),
                                        ),
                                        Expanded(
                                            child:Text(facture!.factureStatutPaiement!, textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),)
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(height: 1, color: Colors.grey[100],),
                                  SizedBox(height: Get.height * 0.01),
                                  SizedBox(
                                    width: 0,
                                    height: 0,
                                    child: Column(children: [
                                      FadeInRight(
                                        child: FormBuilderTextField(
                                          name: 'client_id',
                                          initialValue: facture.clientId.toString(),
                                          validator: ValidatorState.required,
                                          readOnly: true,
                                          decoration: CustomInputDecoration.style1(labelText: 'ID du client'),
                                        ),
                                      ),
                                    ]),
                                  ),
                                  SizedBox(height: Get.height * 0.02),
                                  FadeInRight(
                                    child: Divider(height: 4, color: Colors.orange,),
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
                    Container(padding: EdgeInsets.symmetric(horizontal: 0),
                      child: facture.factureStatutPaiement!.contains('CONDITION A GERER') ?
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(children:[
                          FadeInRight(
                              child:Text("La facture a-t-elle été réglée ou annulée ?",
                                style: Themes.globalFont(style: TextStyle(color: LightColor.black, fontSize: 12)),
                                textAlign: TextAlign.left,
                              )
                          ),
                          FadeInRight(
                            duration: Duration(milliseconds: 600),
                            child: Row(children:[
                              SizedBox(child:
                              ElevatedButton.icon(
                                onPressed: () => controller.updateStatutFacture(facture.factureId!, 'ANNULEE'),
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.red[400], padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0)) ,
                                icon: controller.isLoading.value ? Container(
                                  width: 24,
                                  padding: const EdgeInsets.all(2.0),
                                  child: const CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 3,
                                  ),
                                )
                                    : const Icon(Icons.delete),
                                label: const Text('ANNULEE'),
                              ),
                              ),
                              Expanded(child: Center(child: Text("")),),
                              SizedBox(child: 
                              ElevatedButton.icon(
                                onPressed: () => controller.updateStatutFacture(facture.factureId!, 'EFFECTUEE'),
                                style: ElevatedButton.styleFrom(backgroundColor: AppColor.kPrimaryColor, padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),),
                                icon: controller.isLoading.value ? Container(
                                  width: 24,
                                  height: 24,
                                  padding: const EdgeInsets.all(2.0),
                                  child: const CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 3,
                                  ),
                                )
                                    : const Icon(Icons.check),
                                label: const Text('REGLEE'),
                              ),
                              ),
                            ]),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ]),
                      )
                      : Center(),
                    )
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
      title: Text("Montant total",style: const TextStyle(fontWeight: FontWeight.normal), maxLines: 1,overflow: TextOverflow.ellipsis),
      trailing: Tooltip(
          message: "Montant total",
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
              color: AppColor.kPrimaryColor.withOpacity(.7),
              child:Text(
                Stdfn.toAmount(int.parse(facture!.factureMontantTotal.toString())),
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
