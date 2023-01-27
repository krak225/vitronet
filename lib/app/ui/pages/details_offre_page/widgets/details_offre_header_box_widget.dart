import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';

class DetailsOffreHeaderBoxWidget extends StatelessWidget {
  const DetailsOffreHeaderBoxWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.4,
      decoration: BoxDecoration(
        color: Colors.grey,
        image: DecorationImage(
          image: AssetImage('assets/images/orange-2 1.png'),
          fit: BoxFit.fitHeight,
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
          padding: EdgeInsets.only(
            left: 20,
            bottom: 20,
            right: 20,
          ),
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Get.offAllNamed(AppRoutes.HOME),
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Image.asset('assets/icons/arrow-icon.png'),
                      ),
                    ),
                    TextButton(
                        onPressed: () => null,
                        child: Image.asset('assets/icons/more.png'))
                  ],
                ),
              ),

              Positioned(
                bottom: 0,
                child: Container(
                  //margin: EdgeInsets.only(top: 40),
                  width: Get.width * 0.9,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          width: 45,
                          child: Row(
                            children: [
                              Image.asset('assets/icons/share-icon.png'),
                              SizedBox(width: 10,),
                              Text('8', style: TextStyle(color: Colors.white),),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(width: 20,),
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: 45,
                          child: Row(
                            children: [
                              Image.asset('assets/icons/like-icon.png'),
                              SizedBox(width: 10,),
                              Text('38', style: TextStyle(color: Colors.white),),
                            ],
                          ),
                        ),
                      ),],
                  ),
                ),
              ),


            ],
          )),
    );
  }
}
