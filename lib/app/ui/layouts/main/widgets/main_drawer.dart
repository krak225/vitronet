import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:job_boarder/app/controllers/main_controller.dart';
import 'package:job_boarder/app/routes/app_routes.dart';

import '../../../../config/app_constants.dart';

class MainDrawer extends StatelessWidget {
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
    final MainController controller = Get.put(MainController());

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(firstname + " " + lastname),
            accountEmail: Text(email),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: GetBuilder<MainController>(
                builder: (_) {
                  return controller.getAvatar(50);
                },
              ),
            ),
          ),
          ListTile(
            title: Text('Accueil'),
            //tileColor: Get.currentRoute == AppRoutes.HOME ? Colors.grey[300] : null,
            onTap: () {
              controller.changeIndex(0);
              Get.back();
            },
          ),
          ListTile(
            title: Text('Offres selon mon profil'),
            //tileColor: Get.currentRoute == AppRoutes.HOME ? Colors.grey[300] : null,
            onTap: () {
              controller.changeIndex(1);
              Get.back();
            },
          ),
          ListTile(
            title: Text('Autres offres'),
            //tileColor: Get.currentRoute == AppRoutes.HOME ? Colors.grey[300] : null,
            onTap: () {
              controller.changeIndex(2);
              Get.back();
            },
          ),
          ListTile(
            title: Text('Mes candidatures envoyés'),
            //tileColor: Get.currentRoute == AppRoutes.HOME ? Colors.grey[300] : null,
            onTap: () {
              controller.changeIndex(4);
              Get.back();
            },
          ),
          ListTile(
            title: Text('Mes notififications'),
            //tileColor: Get.currentRoute == AppRoutes.HOME ? Colors.grey[300] : null,
            onTap: () {
              controller.changeIndex(3);
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}