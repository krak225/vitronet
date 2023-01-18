import 'package:flutter/material.dart';

import '../../../theme/light_color.dart';

class IndicatorWidget extends StatelessWidget {
  final int pagesLength;
  final int index;
  const IndicatorWidget(
      {Key? key, required this.pagesLength, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          pagesLength,
          (i) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: i == index ? LightColor.primary : LightColor.grey,
            ),
            margin: EdgeInsets.symmetric(horizontal: 2),
            width: i == index ? 47 : 8,
            height: 5,
          ),
        ));
  }
}
