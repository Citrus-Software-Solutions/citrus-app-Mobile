import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CitrusTheme {
  final whiteColor = Color(0xffffffff);
  final lightGrayColor = Color(0xffe9eaef);
  final grayColor = Color(0xffcfcfd4);
  final darkGrayColor = Color(0xffa5a5a5);
  final darkColor = Color(0xff3b3d44);
  final primaryColor = Color(0xfff29711);
  final primaryLightColor = Color(0xfffdf2e2);

  CitrusTheme();

  ThemeData build() {
    return ThemeData(
      primaryColor: primaryColor,
      textTheme: TextTheme(
        bodyText1: TextStyle(),
        bodyText2: TextStyle(),
      ).apply(
        bodyColor: darkColor,
        displayColor: darkColor,
      ),
    );
  }
}
