import '../../layouts/main/widgets/main_layout_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/register_demande_controller.dart';

class RegisterDemandePage extends GetView<RegisterDemandeController> {
  @override
  Widget build(BuildContext context) {
    return MainLayoutView(
            child: Center(
        child: Text('RegisterDemande'),
      ),
    );
  }
}
