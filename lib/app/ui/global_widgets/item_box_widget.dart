import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../theme/light_color.dart';

class ItemBoxWidget extends StatelessWidget {
  final String title;
  final String icon;
  final dynamic onTap;
  const ItemBoxWidget({Key? key, required this.title, required this.icon, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
          boxShadow: [
            BoxShadow(
              color: LightColor.lightGrey2,
              blurRadius: 5,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: Row(
          children: [
            Image.asset("$icon"),
            SizedBox(
              width: 50,
            ),
            Expanded(
                child: AutoSizeText(
                  "$title",
                  maxLines: 2,
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                )),
          ],
        ),
      ),
    );
  }
}
