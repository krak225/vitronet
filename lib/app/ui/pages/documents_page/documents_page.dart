import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_boarder/app/controllers/main_controller.dart';

import '../../../controllers/documents_controller.dart';
import '../../global_widgets/default_header_widget.dart';
import '../../layouts/main/widgets/main_layout_view.dart';
import '../../theme/light_color.dart';
import '../register_demande_page/widgets/ducoment_item_box_widget.dart';

class DocumentsPage extends GetView<DocumentsController> {
  @override
  Widget build(BuildContext context) {
    
    final MainController mainController = Get.find();
    
    return MainLayoutView(
        child: Column(
          children: [
            DefaultHeaderWidget(title: 'Mes documents'),
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
                                GetBuilder<MainController>(
                                  builder: (_) {
                                    return mainController.getAvatar(50);
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
                        AutoSizeText("Mes documents",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: LightColor.primary)),
                        SizedBox(height: 20),
                        Container(
                          child: Column(
                            children: controller.documents.map((doc) => FadeInRight(child: DocumentItemBoxWidget( doc: doc, onTap: () => controller.selectDocument(doc),))).toList(),
                          ),
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
