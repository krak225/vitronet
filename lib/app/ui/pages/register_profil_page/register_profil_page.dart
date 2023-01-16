import '../../layouts/main/widgets/main_layout_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/register_profil_controller.dart';

class RegisterProfilPage extends GetView<RegisterProfilController> {
  @override
  Widget build(BuildContext context) {
    return MainLayoutView(
            child: Center(
        child: Text('RegisterProfil'),
      ),
    );
  }
}
