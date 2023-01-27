
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:job_boarder/app/ui/pages/comment_page/comment_page.dart';
import 'package:job_boarder/app/ui/pages/search_page/search_page.dart';

import '../ui/pages/home_page/home_page.dart';
import '../ui/theme/light_color.dart';
class MainController extends GetxController {
  final index = 0.obs;
  final pageList = [
    HomePage(),
    SearchPage(),
    CommentPage(),
    Container(),
  ];
  final pageListTitle = ['Accueil', 'Recherche un job...', 'Offres d\'emploi', 'Profil'];

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

  getAvatar() {
    // return userData.value.avatar != null
    //     ? NetworkImage('${AppConstants.BASE_URL}${userData.value.avatar}')
    //     : AssetImage('assets/img/profil.jpg');
    return AssetImage('assets/images/profil.png');
  }

  init(){
    // this.userData.value =
    //     UserModel.fromJson(box.read(AppConstants.USER_STORAGE));
  }

  @override
  void onReady() {
    super.onReady();
   // this.init();
  }
}