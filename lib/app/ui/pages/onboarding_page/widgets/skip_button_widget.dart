
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../theme/themes.dart';

class SkipButtomWidget extends StatelessWidget {
  final dynamic onPressed;
  const SkipButtomWidget({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: AutoSizeText(
          'PASSER',
          maxLines: 3,
          textAlign: TextAlign.center,
          style: Themes.globalFont(
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              )),
        ));
  }
}
