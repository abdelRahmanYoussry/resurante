// ignore: file_names
// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resturente/core/utils/shared/app/color_manager.dart';
import 'package:resturente/core/utils/shared/app/styles_manager.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.white,
  useMaterial3: true,
  fontFamily: 'Roboto',
  appBarTheme: AppBarTheme(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
    color: Colors.white,
    elevation: 0,
    titleTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: ColorManager.mainPrimaryColor4,
    ),
  ),
  datePickerTheme: DatePickerThemeData(
    backgroundColor: ColorManager.white,
    surfaceTintColor: Colors.white,
    cancelButtonStyle: ButtonStyle(
      //   // backgroundColor: MaterialStateProperty.all<Color>(
      //   //   ColorManager.mainPrimaryColor4,
      //   // ),
      //   // alignment: AlignmentDirectional.bottomEnd,
      //   foregroundColor: MaterialStateProperty.all<Color>(
      //     ColorManager.white,
      //   ),
      textStyle: MaterialStateProperty.all(getBoldBlue12Style()),
    ),
    confirmButtonStyle: ButtonStyle(
      textStyle: MaterialStateProperty.all(getBoldBlue12Style()),
    ),
  ),
  timePickerTheme: TimePickerThemeData(
    backgroundColor: Colors.white,
    cancelButtonStyle: ButtonStyle(
      textStyle: MaterialStateProperty.all(getBoldBlue12Style()),
    ),
    confirmButtonStyle: ButtonStyle(
      textStyle: MaterialStateProperty.all(getBoldBlue12Style()),
    ),
    // hourMinuteColor: ColorManager.mainPrimaryColor4,
    hourMinuteColor: MaterialStateColor.resolveWith(
      (states) => states.contains(MaterialState.selected)
          ? ColorManager.mainBlue
          : Colors.white,
    ),
    dayPeriodColor: MaterialStateColor.resolveWith(
      (states) => states.contains(MaterialState.selected)
          ? ColorManager.mainBlue
          : Colors.white,
    ),
    hourMinuteTextColor: MaterialStateColor.resolveWith(
      (states) => states.contains(MaterialState.selected)
          ? ColorManager.white
          : ColorManager.black,
    ),
    dayPeriodTextStyle: getBoldBlack10Style(),
    dayPeriodTextColor: MaterialStateColor.resolveWith(
      (states) => states.contains(MaterialState.selected)
          ? ColorManager.white
          : ColorManager.black,
    ),
  ),
  chipTheme: ChipThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: const BorderSide(
        width: 0.0,
        color: Colors.transparent,
        style: BorderStyle.none,
      ),
    ),
  ),
  colorScheme: ColorScheme.light(
    background: ColorManager.white,
    primary: ColorManager.mainPrimaryColor4,
  ).copyWith(
    background: Colors.white,
  ),
);

// ThemeData darkTheme = ThemeData(
//   tabBarTheme: const TabBarTheme(
//     labelColor: Colors.white,
//     unselectedLabelColor: Colors.red,
//   ),
//   unselectedWidgetColor: Colors.white,
//   scaffoldBackgroundColor: HexColor('333739'),
//   backgroundColor: HexColor('333739'),
//   primaryColor: HexColor('333739'),
//   primarySwatch: Colors.teal,
//   appBarTheme: AppBarTheme(
//       systemOverlayStyle: const SystemUiOverlayStyle(
//           statusBarColor: Colors.transparent,
//           statusBarIconBrightness: Brightness.light),
//       color: HexColor('333739'),
//       elevation: 0,
//       titleTextStyle: const TextStyle(
//           color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
//       iconTheme: const IconThemeData(color: Colors.white)),
//   textTheme: TextTheme(
//     bodyText1: const TextStyle(
//       fontSize: 18,
//       fontWeight: FontWeight.w600,
//       height: 1,
//       color: Colors.white,
//       fontFamily: 'jannah',
//     ),
//     headlineLarge: getBoldBlack24Style(
//         // fontSize: 32, color: ColorManager.textColorBoldBlack
//         ),
//     bodyText2: const TextStyle(
//         fontFamily: 'jannah',
//         fontSize: 22,
//         height: 1,
//         fontWeight: FontWeight.w600,
//         color: Colors.white),
//     subtitle1: const TextStyle(
//       fontSize: 14,
//       fontWeight: FontWeight.w600,
//       color: Colors.white,
//       height: 1,
//       fontFamily: 'jannah',
//     ),
//     subtitle2: const TextStyle(
//       fontSize: 14,
//       fontWeight: FontWeight.w600,
//       color: Colors.white,
//       fontFamily: 'jannah',
//       height: 1,
//     ),
//   ),
// );
