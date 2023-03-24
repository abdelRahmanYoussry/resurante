// ignore: file_names
// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hassy/core/utils/shared/app/color_manager.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.white,
  primarySwatch: Colors.teal,
  backgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light),
    color: Colors.white,
    elevation: 0,
    titleTextStyle: const TextStyle(
        color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    iconTheme: IconThemeData(color: ColorManager.mainPrimaryColor4),
  ),
  textTheme: TextTheme(
    bodyText1: const TextStyle(
        fontFamily: 'jannah',
        fontSize: 18,
        height: 1,
        fontWeight: FontWeight.w600,
        color: Colors.black),
    bodyText2: const TextStyle(
        fontFamily: 'jannah',
        fontSize: 22,
        height: 1,
        fontWeight: FontWeight.w600,
        color: Colors.white),
    subtitle1: TextStyle(
        fontFamily: 'jannah',
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: ColorManager.mainPrimaryColor4,
        height: 1),
    subtitle2: const TextStyle(
        fontSize: 14,
        fontFamily: 'jannah',
        fontWeight: FontWeight.w600,
        color: Colors.red,
        height: 1),
  ),
);

ThemeData darkTheme = ThemeData(
  tabBarTheme: const TabBarTheme(
    labelColor: Colors.white,
    unselectedLabelColor: Colors.red,
  ),
  unselectedWidgetColor: Colors.white,
  scaffoldBackgroundColor: HexColor('333739'),
  backgroundColor: HexColor('333739'),
  primaryColor: HexColor('333739'),
  primarySwatch: Colors.teal,
  appBarTheme: AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light),
      color: HexColor('333739'),
      elevation: 0,
      titleTextStyle: const TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      iconTheme: const IconThemeData(color: Colors.white)),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      height: 1,
      color: Colors.white,
      fontFamily: 'jannah',
    ),
    bodyText2: TextStyle(
        fontFamily: 'jannah',
        fontSize: 22,
        height: 1,
        fontWeight: FontWeight.w600,
        color: Colors.white),
    subtitle1: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      height: 1,
      fontFamily: 'jannah',
    ),
    subtitle2: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontFamily: 'jannah',
      height: 1,
    ),
  ),
);
