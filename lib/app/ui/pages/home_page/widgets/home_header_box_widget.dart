import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeHeaderBoxWidget extends StatelessWidget {
  const HomeHeaderBoxWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.4,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/images/home_header.png'),
          fit: BoxFit.fitWidth,
          alignment: Alignment.bottomCenter,
        ),
      ),
      child: Container(
          decoration: BoxDecoration(
            //borderRadius: BorderRadius.circular(20.0),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(100, 0, 0, 0),
                Color.fromARGB(90, 0, 0, 0),
                Color.fromARGB(80, 0, 0, 0),
                Color.fromARGB(50, 0, 0, 0),
                Color.fromARGB(20, 0, 0, 0),
                Color.fromARGB(0, 0, 0, 0),
                Color.fromARGB(0, 0, 0, 0),
                Color.fromARGB(0, 0, 0, 0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Stack(
            children: [

            ],
          )),
    );
  }
}
