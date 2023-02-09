
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../config/app_constants.dart';
import '../ui/pages/home_page/home_page.dart';
import '../ui/pages/job_page/job_page.dart';
import '../ui/pages/offre_page/offre_page.dart';
import '../ui/theme/light_color.dart';
class MainController extends GetxController {
  final index = 0.obs;
  final pageList = [
    HomePage(),
    JobPage(2, "Liste des offres d'emploi"),
    OffrePage(2, "Liste des offres d'emploi"),
    OffrePage(3, "Mes alerts emploi"),
    OffrePage(4, "Mes candidatures envoyées"),
    OffrePage(1, "Offres selon mon profil"),
    Container(),
  ];

  final pageListTitle = ["Accueil", "Offres d'emploi", "Offres d'emploi", "Mes notifications", "Mes candidatures envoyées", "Offres selon mon profil", "Profil"];

  Future<void> changeIndex(int? index) async {
    //Get.toNamed(pageList[index]);
    this.index.value = index ?? 0;
  }

  closeAppConfirm() {
    Get.defaultDialog(
      title: "Attention!",
      content: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          "Vous êtes sur le point de sortie de l'application JOB BOARDER.",
          textAlign: TextAlign.center,
        ),
      ),
      textConfirm: "CONTINUER",
      textCancel: "ANNULER",
      cancelTextColor: LightColor.primary,
      confirmTextColor: Colors.white,
      barrierDismissible: false,
      onConfirm: () async {
        SystemNavigator.pop();
      },
    );
  }

  goTo(page) {
    Get.toNamed(page);
  }

  getAvatar_armel() {
    // return userData.value.avatar != null
    //     ? NetworkImage('${AppConstants.BASE_URL}${userData.value.avatar}')
    //     : AssetImage('assets/img/profil.jpg');


    return AssetImage('assets/images/profil.png');
  }


  getAvatar(double radius) {

    GetStorage _storage = GetStorage();
    String photo = _storage.read(AppConstants.USER_PHOTO).toString();

      if(photo.length > 4){

        return ClipOval(
          child: SizedBox.fromSize(
            size: Size.fromRadius(radius),
            child: Image.network(photo, fit: BoxFit.cover),
          ),
        );

      }else {

        return CircleAvatar(
          radius: radius,
          backgroundImage: AssetImage('assets/images/profil.png'),
        );

      }

  }


  init(){
    // this.userData.value =
    //     UserModel.fromJson(box.read(AppConstants.USER_STORAGE));

    print('on init');

  }

  @override
  void onReady() {
    super.onReady();
   // this.init();
  }
}