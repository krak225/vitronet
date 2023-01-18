import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../theme/light_color.dart';
import '../theme/themes.dart';

class InputLabelWidget extends StatelessWidget {
  final String text;
  final bool required;
  final Color? color;
  final double? fontSize;
  const InputLabelWidget({Key? key, required this.text, this.required = false, this.color, this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 5),
      child: AutoSizeText.rich(
        TextSpan(text: '$text ', children:
        [
          TextSpan(text:'${required ? '*' : ''}', style: Themes.globalFont(
            style: TextStyle(
              fontSize: fontSize ?? 14,
              fontWeight: FontWeight.w600,
              color: LightColor.red,
            ),
          ),)
        ]),
        maxLines: 1,
        style: Themes.globalFont(
          style: TextStyle(
            fontSize: fontSize ?? 14,
            fontWeight: FontWeight.w600,
            color: color ?? LightColor.grey,
          ),
        ),
      ),
    );
  }
}
