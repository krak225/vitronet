import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_boarder/app/controllers/register_demande_controller.dart';
import 'package:job_boarder/app/ui/theme/light_color.dart';

import '../../../../data/provider/requests/document_dto.dart';
import '../../../global_widgets/button_style1_widget.dart';
import '../../../layouts/main/widgets/main_layout_view.dart';

class RegisterUploadBoxWidget extends StatelessWidget {
  RegisterDemandeController controller = Get.find();
  final DocumentDto doc;
  RegisterUploadBoxWidget({Key? key, required this.doc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayoutView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 50, bottom: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: LightColor.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: TextButton(
                      onPressed: () => Get.back(),
                      child: Icon(Icons.arrow_back, color: Colors.black,)),
                ),
                Expanded(
                  flex: 5,
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: LightColor.lightGrey2,
                    child: Image.asset('assets/icons/camera.png'),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          AutoSizeText(
            "${doc.name}",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: LightColor.grey,
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric( vertical: 30),
            decoration: BoxDecoration(
              color: LightColor.lightGrey2,
              borderRadius: BorderRadius.circular(7),
            ),

            child: Center(
              child: Image.asset(
                "${doc.icon}",
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: ButtonStyle1Widget(
                    radius: 30,
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    height: 40,
                    text: 'Envoyer',
                    onPressed: () => Get.back(result: true),
                  ),
                ),
                SizedBox(width: Get.width * 0.1),
                TextButton(onPressed: () {}, child: Image.asset('assets/icons/attachment.png')),
                TextButton(onPressed: () {}, child: Image.asset('assets/icons/gallery.png')),
                TextButton(onPressed: () {}, child: Image.asset('assets/icons/file.png')),
              ],
            ),
          )


        ],
      ),
    );
  }
}
