import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared_components/header_text.dart';
import '../../controllers/dashboard_controller.dart';

class HeaderVerificationTickets extends StatelessWidget {
  HeaderVerificationTickets({Key? key}) : super(key: key);
  final DashboardController controller = Get.find();
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const HeaderText("Demande de collecte"),
        const Spacer(),
        _buildArchive(),
        const SizedBox(width: 10),
        //_buildAddNewButton(),
      ],
    );
  }

  Widget _buildArchive() {
    return ElevatedButton(
      onPressed: () => null,//controller.changeIndex(1),
      style: ElevatedButton.styleFrom(
        //foregroundColor: Colors.white[850], backgroundColor: Colors.white[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
      ),
      child: null, //const Text("Voir plus"),
    );
  }
}
