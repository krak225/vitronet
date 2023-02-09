import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/main_controller.dart';
import 'bottom_menu_item_widget.dart';

class BottomMenuWidget extends StatelessWidget {
  final MainController controller = Get.find();

  BottomMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      //height: 80,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      // margin: EdgeInsets.only(left: 20, right: 20, bottom: 30),
      decoration: BoxDecoration(
        //borderRadius: BorderRadius.circular(48),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Color(0xff1A181612), offset: Offset(10, 10), blurRadius: 40)
        ],
      ),
      child: Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            BottomMenuItemWidget(
              icon: 'assets/icons/home.png',
              activIcon: 'assets/icons/home-active.png',
              isSelected: controller.index.value == 0,
              onPressed: () => controller.changeIndex(0),
            ),

            BottomMenuItemWidget(
              icon: 'assets/icons/comment.png',
              activIcon: 'assets/icons/comment-active.png',
              isSelected: controller.index.value == 1 || controller.index.value == 2 || controller.index.value == 3 || controller.index.value == 4 || controller.index.value == 5 ,
              onPressed: () => controller.changeIndex(1),
            ),

            /*
            BottomMenuItemWidget(
              icon: 'assets/icons/find.png',
              activIcon: 'assets/icons/find-active.png',
              isSelected: controller.index.value == 2,
              onPressed: () => controller.changeIndex(2),
            ),
            */

            BottomMenuItemWidget(
              icon: 'assets/icons/notification.png',
              activIcon: 'assets/icons/notification-active.png',
              isSelected: controller.index.value == 3,
              onPressed: () => controller.changeIndex(3),
            ),

            /*
            BottomMenuItemWidget(
              icon: 'assets/icons/certificat.png',
              activIcon: 'assets/icons/certificat.png',
              isSelected: controller.index.value == 4,
              onPressed: () => controller.changeIndex(4),
            ),

            BottomMenuItemWidget(
              icon: 'assets/icons/user.png',
              activIcon: 'assets/icons/user.png',
              isSelected: controller.index.value == 5,
              onPressed: () => Get.toNamed(AppRoutes.PROFIL),
            ),

            BottomMenuItemWidget(
              icon: 'assets/icons/user.png',
              activIcon: 'assets/icons/user.png',
              isSelected: controller.index.value == 5,
              onPressed: () => Get.toNamed(AppRoutes.PROFIL),
            ),
            */




          ],
        ),
      ),
    );
  }
}
