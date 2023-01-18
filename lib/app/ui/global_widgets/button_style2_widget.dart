
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/light_color.dart';
import '../theme/themes.dart';

class ButtonStyle2Widget extends StatelessWidget {
  final Color? color;
  final String text;
  final dynamic onPressed;
  final double? radius;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final Widget? rightWidget;
  const ButtonStyle2Widget({Key? key, this.color, required this.text, required this.onPressed, this.radius, this.height, this.rightWidget, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPressed,
      child: Stack(
        children: [
          Container(
            height: this.height ?? 30,
            decoration: BoxDecoration(
              color: LightColor.second,
              borderRadius: BorderRadius.circular(this.radius ?? 10),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff000000).withOpacity(0.11),
                  spreadRadius: 1,
                  blurRadius: 30,
                  offset: Offset(0, 20), // changes position of shadow
                ),
              ],
            )
          ),
          Container(
            height: this.height != null ?  (this.height! - 5) : 25,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.22),
              borderRadius: BorderRadius.circular(this.radius ?? 10),
              // border: Border.all(color: this.color ?? LightColor.primary),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Text(
                    this.text,
                    style: Themes.globalFont(
                        style: TextStyle(
                            fontSize: 15,
                            color: LightColor.titleTextColor,
                            fontWeight: FontWeight.w700)),
                  ),
                ),
                this.rightWidget ?? SvgPicture.asset('assets/icons/arrow-right2.svg', height: 11,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
