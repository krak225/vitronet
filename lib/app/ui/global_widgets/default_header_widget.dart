import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/themes.dart';

class DefaultHeaderWidget extends StatelessWidget {
  final String title;
  final Widget? rightWidget;
  final bool showBackButton;

  const DefaultHeaderWidget(
      {Key? key,
      required this.title,
      this.rightWidget,
      this.showBackButton = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     // height: 85,
      padding: EdgeInsets.only(top: 30, left: 10, right: 10, ),
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: showBackButton
                ? TextButton(
                    onPressed: () => Get.back(),
                    child: Icon(Icons.arrow_back, size: 24, color: Colors.black,))
                : SizedBox(),
          ),
          Expanded(
            flex: 5,
            child: AutoSizeText(title,
                maxLines: 1,
                minFontSize: 14,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: Themes.globalFont(
                    style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  //color: LightColor.primary,
                ))),
          ),
          Expanded(
            flex: 1,
            child: rightWidget ?? Container()
          )
        ],
      ),
    );
  }
}
