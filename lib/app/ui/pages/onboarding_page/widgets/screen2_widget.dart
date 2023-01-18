
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Screen2Widget extends StatelessWidget {
  const Screen2Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return DecoratedBox(
        decoration: BoxDecoration(
          //color: LightColor.primary,
         image: DecorationImage(
            image: AssetImage('assets/images/screen2.png'),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
          ),
          
        ),
        child: Container(
          height: Get.height * 0.6,
          width: Get.width,
        )
       
    );
  }
}
