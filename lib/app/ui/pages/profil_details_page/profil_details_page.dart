import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../config/app_constants.dart';
import '../../../controllers/profil_details_controller.dart';
import '../../../controllers/profil_update_controller.dart';
import '../../global_widgets/default_header_widget.dart';
import '../../layouts/main/widgets/main_layout_view.dart';
import '../../theme/custom_input_decoration.dart';
import '../../theme/light_color.dart';

class ProfilDetailsPage extends GetView<ProfilDetailsController> {

  ProfilUpdateController profilUpdateController = Get.put(ProfilUpdateController());

  @override
  Widget build(BuildContext context) {

    GetStorage _storage = GetStorage();
    String email = _storage.read(AppConstants.USER_EMAIL).toString();
    String firstname = _storage.read(AppConstants.USER_FIRSTNAME).toString();
    String lastname = _storage.read(AppConstants.USER_LASTNAME).toString();
    String telephone = _storage.read(AppConstants.USER_TELEPHONE).toString();
    String adresse = _storage.read(AppConstants.USER_ADRESSE).toString();
    String genre = _storage.read(AppConstants.USER_GENRE).toString();
    String domaine = _storage.read(AppConstants.USER_DOMAINE).toString();
    String experience = _storage.read(AppConstants.USER_EXPERIENCE).toString();
    String diplome = _storage.read(AppConstants.USER_DIPLOME).toString();
    String photo = _storage.read(AppConstants.USER_PHOTO).toString();

    return MainLayoutView(
        child: Column(
        children: [
          DefaultHeaderWidget(title: 'Mes informations'),
          Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                              // color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xff111111).withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                    offset: Offset(0, 14))
                              ], borderRadius: BorderRadius.circular(50)),
                          child: Stack(
                            children: [
                              GetBuilder<ProfilUpdateController>(
                                builder: (_) {
                                  return profilUpdateController.getAvatar(photo);
                                },
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  // height: 40,
                                  // width: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    // border: Border.all(
                                    //   width: 4,
                                    //   color: Theme.of(context).scaffoldBackgroundColor,
                                    // ),
                                    color: LightColor.second,
                                  ),
                                  child: Image.asset('assets/images/photo.png'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Divider(
                        color: LightColor.lightGrey2,
                      ),
                      AutoSizeText("Informations personnelles",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: LightColor.primary)),
                      SizedBox(height: 20),
                      Container(
                        child: Column(children: [
                          Row(
                            children: [
                              Expanded(
                                child: FadeInRight(
                                  child: TextFormField(
                                    enabled: false,
                                    initialValue: firstname,
                                    decoration: CustomInputDecoration.style1(labelText: 'Prénoms', border: InputBorder.none,),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: FadeInRight(
                                  child: TextFormField(
                                    enabled: false,
                                    initialValue: lastname,
                                    decoration: CustomInputDecoration.style1(labelText: 'Nom de famille', border: InputBorder.none,),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Get.height * 0.04),
                          FadeInRight(
                            child: TextFormField(
                              enabled: false,
                              initialValue: email,
                              decoration:CustomInputDecoration.style1(labelText: 'E-mail', border: InputBorder.none,),
                            ),
                          ),
                          SizedBox(height: Get.height * 0.04),
                          Row(
                            children: [
                              Expanded(
                                child: FadeInRight(
                                  child: TextFormField(
                                    enabled: false,
                                    initialValue: genre,
                                    decoration: CustomInputDecoration.style1(labelText: 'Le genre', border: InputBorder.none,),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: FadeInRight(
                                  child: TextFormField(
                                    enabled: false,
                                    initialValue: telephone,
                                    decoration: CustomInputDecoration.style1(labelText: 'Phone', border: InputBorder.none,),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Get.height * 0.04),
                          Row(
                            children: [
                              Expanded(
                                child: FadeInRight(
                                  child: TextFormField(
                                    enabled: false,
                                    initialValue: experience,
                                    decoration: CustomInputDecoration.style1(labelText: "Année d'expérience", border: InputBorder.none,),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: FadeInRight(
                                  child: TextFormField(
                                    enabled: false,
                                    initialValue: domaine,
                                    decoration: CustomInputDecoration.style1(labelText: "Métier", border: InputBorder.none,),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Get.height * 0.04),
                          FadeInRight(
                            child: TextFormField(
                              enabled: false,
                              initialValue: diplome +" ",
                              decoration:CustomInputDecoration.style1(labelText: 'Diplôme', border: InputBorder.none,),
                             ),
                          ),
                        ]),
                      ),
                      SizedBox(height: 20),

                      Divider(
                        color: LightColor.lightGrey2,
                      ),

                    ],
                  ),
                ),
            )
          )
        ],
      )
    );
  }
}
