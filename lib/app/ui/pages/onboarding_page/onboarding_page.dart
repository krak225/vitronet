import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:job_boarder/app/ui/pages/onboarding_page/widgets/indicator_widget.dart';
import 'package:job_boarder/app/ui/theme/light_color.dart';
import 'package:onboarding/onboarding.dart';

import '../../global_widgets/button_style1_widget.dart';
import '../../layouts/main/widgets/main_layout_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/onboarding_controller.dart';

class OnboardingPage extends GetView<OnboardingController> {
  @override
  Widget build(BuildContext context) {
    return MainLayoutView(
      hPadding: 0.0,
      //backgroundColors: LightColor.primary,
      child: Onboarding(
        pages: controller.onboardingPagesList,
        onPageChange: (int pageIndex) {
          controller.index = pageIndex;
        },
        startPageIndex: 0,
        footerBuilder: (context, dragDistance, pagesLength, setIndex) {
         

          return Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
            child: GestureDetector(
             
              onHorizontalDragEnd: (details) {
                print(details);
                print("onHorizontalDragEnd");
               if (controller.index < (pagesLength - 1)) {
                  controller.index++;
                } else {
                  controller.index = 0;
                }
                setIndex(controller.index);
              },
              child: Column(
                children: [
                  AutoSizeText(
                    "138 064 offres d'emploi disponibles",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                  SizedBox(height: Get.height * 0.008),
                  AutoSizeText(
                    "Rechercher des offres par région ou par secteur d'activité",
                    style: TextStyle(
                      color: LightColor.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                  /*AutoSizeText(
                    "secteur d'activité",
                    style: TextStyle(
                      color: LightColor.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),*/
                  SizedBox(height: Get.height * 0.05),
                  IndicatorWidget(
                    index: controller.index,
                    pagesLength: pagesLength,
                  ),
                  SizedBox(height: Get.height * 0.04),
                  FadeInRight(
                    duration: Duration(milliseconds: 600),
                    child: ButtonStyle1Widget(
                      text: 'Commencer',
                      onPressed: () {
                        controller.goToHome();
                      },
                    ),
                  ),
                  SizedBox(height: Get.height * 0.05),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
