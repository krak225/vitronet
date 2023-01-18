import 'package:flutter/material.dart';

class BottomMenuItemWidget extends StatelessWidget {
  final dynamic onPressed;
  final Widget? iconWidget;
  final String icon;
  final String activIcon;
  final bool isSelected;

  const BottomMenuItemWidget(
      {Key? key,
      this.onPressed,
      this.iconWidget,
      this.isSelected = false,
      required this.icon,
      required this.activIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: iconWidget ??
            (isSelected
                ? Image.asset(activIcon)
                : Image.asset(icon)));
  }
}
