import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../theme/light_color.dart';

class RadioBoxWidget extends StatelessWidget {
  final bool isSelected;
  final String title;
  final String subtitle;
  final dynamic onTap;
  const RadioBoxWidget({Key? key, required this.isSelected, required this.title, required this.subtitle, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 115,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: LightColor.lightGrey2),
        ),
        child: Row(
          children: [
            if(!isSelected)
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: LightColor.lightGrey2,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            if(isSelected)
            Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  //color: LightColor.lightGrey2,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: LightColor.lightGrey2),
                ),
                child: Container(
                    margin: EdgeInsets.all(5),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: LightColor.primary,
                      borderRadius: BorderRadius.circular(30),
                    ))),
            SizedBox(
              width: 20,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  "$title",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: LightColor.black,
                  ),
                  maxLines: 1,
                ),
                AutoSizeText(
                  "$subtitle",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.normal,
                    color: LightColor.black,
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
