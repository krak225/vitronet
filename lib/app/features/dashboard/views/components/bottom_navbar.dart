import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constans/app_color.dart';
import '../../controllers/dashboard_controller.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  final DashboardController controller = Get.put(DashboardController(), permanent: false);

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: controller.tabIndex.value,
      items: const [
        BottomNavigationBarItem(
          activeIcon: Icon(EvaIcons.home),
          icon: Icon(EvaIcons.homeOutline),
          label: "Accueil",
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(EvaIcons.checkmarkCircle2),
          icon: Icon(EvaIcons.checkmarkCircle2Outline),
          label: "Tickets vérifiés",
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(EvaIcons.archive),
          icon: Icon(EvaIcons.archiveOutline),
          label: "Faux Tickets",
        ),
      ],
      selectedItemColor: AppColor.bleu,//Theme.of(context).primaryColor,
      unselectedItemColor: AppColor.bleu.withOpacity(.5),//Theme.of(context).primaryColor.withOpacity(.5),
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      onTap: (value) {
        controller.changeIndex(value);
        setState(() {
          index = value;
        });
      },
    );
  }
}
