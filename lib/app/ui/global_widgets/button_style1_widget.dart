
import 'package:flutter/material.dart';

import '../theme/light_color.dart';

class ButtonStyle1Widget extends StatelessWidget {
  final Color? color;
  final String text;
  final dynamic onPressed;
  final double? radius;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final Widget? rightWidget;
  const ButtonStyle1Widget({Key? key, this.color, required this.text, required this.onPressed, this.radius, this.height, this.rightWidget, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: this.onPressed,
      child: Container(
        height: this.height ?? 50,
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              this.text,
              style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,),
            ),
            this.rightWidget ?? Container(width: 0,height: 0),
          ],
        ),
      ),
      style: TextButton.styleFrom(
          foregroundColor: this.color ?? Colors.white, 
          backgroundColor: this.color ?? LightColor.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(this.radius ?? 10)),
          )),
    );
  }
}
