import 'package:flutter/material.dart';

import 'light_color.dart';
import 'themes.dart';

class CustomInputDecoration {

 static InputDecoration style1({String? labelText}) {
    return InputDecoration(
        labelText: labelText,
        labelStyle: Themes.globalFont(
            style: TextStyle(color: LightColor.lightGrey2, fontSize: 12)),
        hintStyle: Themes.globalFont(
            style: TextStyle(color: LightColor.lightGrey2, fontSize: 12)),
        contentPadding:
        EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        floatingLabelStyle: Themes.globalFont(
            style: TextStyle(color: LightColor.black, fontSize: 14)),
        hintText: labelText,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                color: LightColor.primary, width: 0.5)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                color: LightColor.lightGrey2, width: 0.5)),
        );
  }

 static InputDecoration style2({String? labelText, String? hintText}) {
   return InputDecoration(
     //labelText: labelText,
     labelStyle: Themes.globalFont(
         style: TextStyle(color: LightColor.lightGrey2, fontSize: 12)),
     hintStyle: Themes.globalFont(
         style: TextStyle(color: LightColor.lightGrey2, fontSize: 12)),
     contentPadding:
     EdgeInsets.symmetric(horizontal: 20, vertical: 0),
     floatingLabelStyle: Themes.globalFont(
         style: TextStyle(color: LightColor.black, fontSize: 14)),
     hintText: labelText,
     focusedBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(8),
         borderSide: BorderSide(
             color: LightColor.primary, width: 0.5)),
     enabledBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(8),
         borderSide: BorderSide(
             color: LightColor.lightGrey2, width: 0.5)),
   );
 }

 static InputDecoration style3({String? labelText,String? hintText, Widget? prefixIcon, Widget? suffixIcon}) {
   return InputDecoration(
       labelText: labelText,
       labelStyle: Themes.globalFont(
           style: TextStyle(color: LightColor.darkGrey, fontSize: 20)),
       contentPadding:
       EdgeInsets.symmetric(horizontal: 20, vertical: 0),
       floatingLabelStyle: Themes.globalFont(
           style: TextStyle(color: LightColor.grey, fontSize: 14)),
       hintText: hintText ?? '_',
       floatingLabelBehavior: FloatingLabelBehavior.always,
       // focusedBorder: OutlineInputBorder(
       //     borderRadius: BorderRadius.circular(5),
       //     borderSide: BorderSide(
       //         color: LightColor.primary, width: 1.0)),
       // fillColor: LightColor.lightGrey2,
       // filled: true,
       prefixIcon: prefixIcon,
       suffixIcon: suffixIcon,
       border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(5),
           borderSide: BorderSide.none));
 }

}
