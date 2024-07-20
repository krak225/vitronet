
import 'package:flutter/material.dart';

class AccountAmount extends StatelessWidget {
  const AccountAmount({
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
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color.withOpacity(.8),
          ),
        ),
        const SizedBox(width: 5),
        Icon(
          iconData,
          color: color,
          size: 24,
        ),
      ],
    );
  }
}