
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/ui/theme/light_color.dart';


class SocialButtomWidget extends StatelessWidget {
  final dynamic onPressed;
  final String text;
  final String icon;
  const SocialButtomWidget({Key? key, this.onPressed, required this.text, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: Get.width,
        height: 50,
        padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.1,
            vertical: Get.height * 0.01),
        decoration: BoxDecoration(
            border: Border.all(color: LightColor.grey),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/$icon',
              ),
              SizedBox(
                width: 10,
              ),
              AutoSizeText(
                "$text",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: LightColor.black,
                ),
                //textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
