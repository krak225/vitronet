import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get_storage/get_storage.dart';
import 'package:job_boarder/app/ui/global_widgets/search_box_widget.dart';
import 'package:job_boarder/app/ui/theme/light_color.dart';

import '../../../config/app_constants.dart';
import '../../../controllers/details_offre_controller.dart';
import '../../../data/models/offre.dart';
import '../../../routes/app_routes.dart';
import '../../global_widgets/button_style1_widget.dart';
import '../../global_widgets/button_style2_widget.dart';
import '../../global_widgets/button_style4_widget.dart';
import '../../global_widgets/item_box_widget.dart';
import '../../layouts/main/widgets/main_layout_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/comment_controller.dart';
import '../../theme/custom_input_decoration.dart';
import '../home_page/widgets/home_header_box_widget.dart';
import '../login_page/widgets/social_buttom_widget.dart';
import 'widgets/details_offre_header_box_widget.dart';


class DetailsOffrePage extends GetView<DetailsOffreController> {

  @override
  Widget build(BuildContext context) {

    GetStorage _storage = GetStorage();
    String user_id = _storage.read(AppConstants.USER_ID).toString();

    final Comment comment = Get.arguments;
    print(comment);

    return MainLayoutView(
        hPadding: 0,
        child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            DetailsOffreHeaderBoxWidget(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(0),
                boxShadow: [
                  BoxShadow(
                    color: LightColor.lightGrey2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Row(
                children: [
                  Image.asset(comment.offre_image),
                  SizedBox(
                    width: 50,
                  ),
                  Expanded(
                      child: AutoSizeText(
                        comment.offretitre,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: FadeInRight(
                            child: Text("Lieu de travail"),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: FadeInRight(
                            child: Text("Niamey", textAlign: TextAlign.right, style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: LightColor.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: FadeInRight(
                            child: Text("Référence"),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: FadeInRight(
                            child: Text("#JOB-"+comment.id.toString(), textAlign: TextAlign.right, style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: LightColor.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: FadeInRight(
                            child: Text("Nombre de poste"),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: FadeInRight(
                            child: Text(comment.offrenombreposte.toString(), textAlign: TextAlign.right, style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: LightColor.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: FadeInRight(
                            child: Text("Date publication"),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: FadeInRight(
                            child: Text(comment.offre_datepublic, textAlign: TextAlign.right, style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: LightColor.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: FadeInRight(
                            child: Text("Diplôme"),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: FadeInRight(
                            child: Text("BAC +2/3", textAlign: TextAlign.right, style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: LightColor.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: FadeInRight(
                            child: Text("Type de contrat"),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: FadeInRight(
                            child: Text("CDI", textAlign: TextAlign.right, style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: LightColor.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: FadeInRight(
                            child: Text("Description du poste", textAlign: TextAlign.left, style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                color: LightColor.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      child: Text(comment.offredescription),
                    ),
                  ),
                  SizedBox(height: 40,),
                  FormBuilder(
                    key: controller.formKey,
                    ///initialValue: controller.initValues,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: SizedBox(
                      width: 0,
                      height: 0,
                      child: Column(children: [
                        FormBuilderTextField(
                            name: 'offre_id',
                            initialValue: comment.id.toString(),
                            decoration:CustomInputDecoration.style1(labelText: 'offre_id'),
                          ),
                        FormBuilderTextField(
                            name: 'user_id',
                            initialValue: user_id.toString(),
                            enabled: false,
                            decoration:CustomInputDecoration.style1(labelText: 'user_id'),
                          ),
                      ]),
                    ),
                  ),
                  Visibility(
                    visible: controller.isPostulable.value,
                    child: FadeInRight(
                      duration: Duration(milliseconds: 900),
                      child: ButtonStyle1Widget(
                        text: 'Postuler',
                        onPressed: () => controller.postuler(comment.id.toString()),
                        color: LightColor.second
                      ),
                    ),
                  ),
                  SizedBox(height: 10,)
                ],
              ),
            ),
          ],
        ),
        ),
    );
  }
}
