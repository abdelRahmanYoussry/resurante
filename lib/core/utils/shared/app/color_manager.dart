// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = const Color(0XFFED9728);
  static Color darkGrey = const Color(0Xff525252);
  static Color grey = const Color(0Xff737477);
  static Color lightGrey = const Color(0Xff9E9E9E);

  static Color darkPrimary = const Color(0Xffd17d11); // COLOR WITH 800% OPACITY
  static Color lightPrimary = const Color(0XCCd17d11);
  static Color grey1 = const Color(0Xff707070);
  static Color grey2 = const Color(0Xff797979);
  static Color white = const Color(0XffFFFFFF);
  static Color error = const Color(0Xffe61f34);
  //Abdo
  static Color textFormBorderColor = const Color(0Xff707070);
  static Color mainPrimaryColor4 = Color(0Xff439A97);
  static Color mainPrimaryColor3 = const Color(0Xff62B6B7);
  static Color mainPrimaryColor2 = const Color(0Xff97DECE);
  static Color mainPrimaryColor1 = const Color(0XffCBEDD5);
  static Color backGroundColor = Colors.white;
  static Color unSelectedIconButtonColor = Colors.grey.withOpacity(0.6);
  static Color priceColor = Colors.red;

  //change Theme Color
  static Color pinkColor = Colors.pink;
  static Color blueColor = Colors.blue;
  static Color tealColor = Color(0Xff439A97);
  static Color purpleColor = Colors.purple;
  static Color greenColor = Colors.green;
  static Color orangeColor = Colors.orange;

  static Color styleColor({required Color changeColor}) => changeColor;

  static Color testColor = const Color(0xFF012B44);
  static Color transparentColor = Colors.transparent;
}
