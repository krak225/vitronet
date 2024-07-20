import 'dart:ffi';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hello_depart/app/features/dashboard/controllers/home_controller.dart';
import 'package:hello_depart/app/shared_components/icon_label.dart';

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
                colors: [Colors.blue, Colors.green.withOpacity(.7)],
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
                      _doneButton(),
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
    return Expanded(child: Image.asset('assets/images/qrcode.png', height: 400,));
  }

  Widget _doneButton() {
    return ElevatedButton.icon(
      onPressed: () => controller.scanTicket(),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.blue,
      ),
      icon: const Icon(EvaIcons.checkmarkCircle2Outline),
      label: Text("Scanner un ticket"),
    );
  }
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
