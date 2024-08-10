import 'dart:ffi';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_depart/app/constans/app_color.dart';
import 'package:hello_depart/app/features/dashboard/controllers/home_controller.dart';
import 'package:hello_depart/app/shared_components/form_verfication_numero_ticket.dart';
import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';

import '../utils/ui/theme/snackbar_ui.dart';

class ScanButton extends StatelessWidget {

  const ScanButton({
    required this.controller,
    Key? key,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        child: InkWell(
          onTap: () => controller.scanTicket(),
          child: Container(
            width: 400,
            height: 170,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.black.withOpacity(.7)],
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter,
              ),
            ),
            child: _BackgroundDecoration(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildQRcode(),
                      Container(
                        //width: 200,
                        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.5),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(children: [
                          _VerifyByQrcodeButton(context),
                          SizedBox(width: 4,),
                          _VerifyByNumberButton(context),
                        ])
                      ),
                      //Center(child: IconLabel(color: Colors.white, iconData: EvaIcons.camera, label: "Scanner"))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }



  Widget _buildQRcode() {
    return Center(child:
      Row(children: [
        Expanded(child: Image.asset('assets/images/qrcode.png', height: 100)),
        //Expanded(child: Image.asset('assets/images/qrcode.png', height: 100)),
      ])
    );
  }

  Widget _VerifyByQrcodeButton(BuildContext context) {
    return ElevatedButton.icon(
      //onPressed: () => controller.scanTicket(),
      onPressed: () => QrBarCodeScannerDialog().getScannedQrBarCode(
          context: context,
          onCode: (code) {
            controller.verifTicket(code.toString(), 0, context);
            //SnackbarUi.success("Vérification du code: " + code.toString());
          }),
      //onPressed: () => controller.verifTicket("1"),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black, backgroundColor: AppColor.yellow, //padding: const EdgeInsets.symmetric(horizontal: , vertical: 0),
      ),
      icon: const Icon(EvaIcons.cameraOutline),
      label: Text("Scanner QR Code"),
    );
  }
}

Widget _VerifyByNumberButton(BuildContext context) {
  return ElevatedButton.icon(
    //onPressed: () => controller.scanTicket(),
    onPressed: () {
      showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          isScrollControlled: true,
          builder: (context) {

            return FormVerificationNumeroTicket(evenement_id: 0, onVerificationSuccess: () {
              Navigator.pop(context);
            });

          }
      );
    },
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.black, backgroundColor: Colors.white, //padding: const EdgeInsets.symmetric(horizontal: , vertical: 0),
    ),
    icon: const Icon(EvaIcons.keypadOutline),
    label: Text("Saisir numéro"),
  );
}

class _BackgroundDecoration extends StatelessWidget {
  const _BackgroundDecoration({required this.child, Key? key})
      : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Transform.translate(
            offset: const Offset(25, -25),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white.withOpacity(.1),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Transform.translate(
            offset: const Offset(-70, 70),
            child: CircleAvatar(
              radius: 100,
              backgroundColor: Colors.white.withOpacity(.1),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
