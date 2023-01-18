import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/main_controller.dart';
import 'widgets/bottom_menu_widget.dart';
import 'widgets/header2_widget.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.closeAppConfirm();
        return false;
      },
      child: Scaffold(
        body: Obx(
          () => Column(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: Header2Widget(
                      title: controller.pageListTitle[controller.index.value],
                    ),
              ),

              Expanded(child: controller.pageList[controller.index.value]),
            ],
          ),
        ),
        bottomNavigationBar: BottomMenuWidget(),
      ),
    );
  }
}
