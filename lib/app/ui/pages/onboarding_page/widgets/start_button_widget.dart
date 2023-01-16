import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../theme/light_color.dart';
import '../../../theme/themes.dart';
class StartButtonWidget extends StatelessWidget {
  final dynamic onPressed;
  const StartButtonWidget({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
            //border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        width: double.infinity,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'DÉCOUVRIR',
              style: Themes.globalFont(
                  style: TextStyle(
                      fontSize: 16,
                      color: LightColor.primary,
                      fontWeight: FontWeight.w600)),
            ),
            SizedBox(width: 10,),
            SvgPicture.asset('assets/icons/arrow-right.svg', color: LightColor.primary,),
          ],
        ),
      ),
      style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(5)),
          )),
    );
  }
}
