import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';

import '../../../../shared_components/selection_button.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({
    required this.onSelected,
    Key? key,
  }) : super(key: key);

  final Function(int index, SelectionButtonData value) onSelected;

  @override
  Widget build(BuildContext context) {
    return SelectionButton(
      data: [
        SelectionButtonData(
          activeIcon: EvaIcons.home,
          icon: EvaIcons.homeOutline,
          label: "Accueil",
        ),
        SelectionButtonData(
          activeIcon: EvaIcons.bell,
          icon: EvaIcons.bellOutline,
          label: "Départs",
          totalNotif: 0,
        ),
        SelectionButtonData(
          activeIcon: EvaIcons.checkmarkCircle2,
          icon: EvaIcons.checkmarkCircle,
          label: "Tickets vendus",
          totalNotif: 0,
        ),
        SelectionButtonData(
          activeIcon: EvaIcons.creditCard,
          icon: EvaIcons.creditCardOutline,
          label: "Mes commissions",
          totalNotif: 0,
        ),
      ],
      onSelected: onSelected,
    );
  }
}
