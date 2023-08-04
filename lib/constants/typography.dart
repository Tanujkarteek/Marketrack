import 'package:flutter/material.dart';

extension TextThemeExt on TextTheme {
  //Headings
  TextStyle get h1 =>
      const TextStyle(fontSize: 24, fontWeight: FontWeight.w700);

  //Buttons
  TextStyle get button1 =>
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w500);

  //Body
  TextStyle get body1 =>
      const TextStyle(fontSize: 10, fontWeight: FontWeight.w400);

  void setHeadlineSize(){

  }



}

extension ColorExt on ColorScheme {
  Color get links => const Color(0xff004ED7);

  Color get transparent => Colors.transparent;

  Color get purple => const Color.fromRGBO(86, 16, 57, 1);
}
