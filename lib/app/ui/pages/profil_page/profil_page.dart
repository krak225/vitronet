import 'package:auto_size_text/auto_size_text.dart';

import '../../global_widgets/default_header_widget.dart';
import '../../layouts/main/widgets/main_layout_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/profil_controller.dart';
import '../../theme/light_color.dart';
import 'widgets/profil_box_widget.dart';

class ProfilPage extends GetView<ProfilController> {
  @override
  Widget build(BuildContext context) {
    return MainLayoutView(
        child: Column(
      children: [
        DefaultHeaderWidget(title: 'Profil'),
        Expanded(
            child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                ProfilBoxWidget(),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: Image.asset('assets/icons/profil-user.png'),
                  title: AutoSizeText(
                    'Mon information',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: LightColor.black),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: LightColor.black.withOpacity(0.8),
                    size: 18,
                  ),
                  onTap: () =>null,
                ),
                Divider(
                  color: LightColor.grey,
                ),
                ListTile(
                  leading: Image.asset('assets/icons/profil-settings.png'),
                  title: AutoSizeText(
                    'Réglages',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: LightColor.black),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: LightColor.black.withOpacity(0.8),
                    size: 18,
                  ),
                  onTap: () =>null,
                ),
                Divider(
                  color: LightColor.grey,
                ),
                ListTile(
                  leading: Image.asset('assets/icons/off.png'),
                  title: AutoSizeText(
                    'Se déconnecter',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: LightColor.black),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: LightColor.black.withOpacity(0.8),
                    size: 18,
                  ),
                  onTap: () => controller.logout(),
                ),
              ],
            ),
          ),
        ))
      ],
    ));
  }
}
