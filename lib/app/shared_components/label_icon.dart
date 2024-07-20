
import 'package:flutter/material.dart';

class LabelIcon extends StatelessWidget {
  const LabelIcon({
    required this.color,
    required this.iconData,
    required this.label,
    Key? key,
  }) : super(key: key);

  final Color color;
  final IconData iconData;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: color.withOpacity(.8),
          ),
        ),
        const SizedBox(width: 5),
        Icon(
          iconData,
          color: color,
          size: 18,
        ),
      ],
    );
  }
}