import 'package:flutter/material.dart';

import '../../../theme/light_color.dart';

class MainLayoutView extends StatelessWidget {
  final Widget child;
  final double? hPadding;
  final bool isLoading;
  final Color? backgroundColors;

  const MainLayoutView(
      {Key? key,
      required this.child,
      this.hPadding,
      this.isLoading = false,
      this.backgroundColors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: this.backgroundColors ?? LightColor.background,
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: hPadding ?? 0),
          child: child),
    );
  }
}
