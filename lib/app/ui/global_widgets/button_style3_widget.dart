import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/themes.dart';
class ButtonStyle3Widget extends StatelessWidget {
  final dynamic onPressed;
  final Color? color;
  final String text;
  final double? radius;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final Widget? rightWidget;
  const ButtonStyle3Widget({Key? key, this.onPressed, this.color, required this.text, this.radius, this.height, this.padding, this.rightWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: color ?? Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 8))
        ),
        padding: padding ?? EdgeInsets.symmetric(horizontal: 25),
        height: height ?? 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: Themes.globalFont(
                  style: TextStyle(
                      fontSize: 16,
                      color: color ?? Colors.white,
                      fontWeight: FontWeight.w600)),
            ),
            rightWidget ??
            SizedBox(width: 10,),
            rightWidget ??
            SvgPicture.asset('assets/icons/arrow-right.svg',),
          ],
        ),
      ),
      style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(5)),
          )),
    );
  }
}
