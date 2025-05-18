// import 'dart:ui' as ui;
//
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:resturente/core/utils/shared/app/color_manager.dart';
//
// import '../filter_parameters/available_lessons_parameters.dart';
// import '../filter_parameters/reserved_lessons_parameters.dart';
// import '../translations/locale_keys.g.dart';
//
// class SortPopUpMenuWidget extends StatelessWidget {
//   const SortPopUpMenuWidget(
//       {super.key,
//       required this.isAvailableLessons,
//       required this.isPreviousLessons,
//       required this.isReservedLessons,
//       required this.onSort,
//       required this.isStudent});
//   final bool isAvailableLessons;
//   final bool isReservedLessons;
//   final bool isPreviousLessons;
//   final bool isStudent;
//   final Function onSort;
//
//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton(
//       color: ColorManager.white,
//       icon: Directionality(
//         textDirection: context.locale == "ar"
//             ? ui.TextDirection.ltr
//             : ui.TextDirection.ltr,
//         child: Icon(
//           Icons.sort,
//           size: 35,
//           color: Theme.of(context).scaffoldBackgroundColor,
//         ),
//       ),
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(12),
//           bottom: Radius.circular(12),
//         ),
//       ),
//       itemBuilder: (context) => [
//         PopupMenuItem(
//           value: MenuItem.item1,
//           onTap: () {
//             if (isStudent) {
//               if (isAvailableLessons) {
//                 serviceLocator<StudentAvailableLessonsParameters>()
//                     .sortPriceLowToHigh = null;
//                 serviceLocator<StudentAvailableLessonsParameters>()
//                     .sortDateFar = null;
//                 serviceLocator<StudentAvailableLessonsParameters>()
//                     .sortDateNear = null;
//                 serviceLocator<StudentAvailableLessonsParameters>()
//                     .sortPriceHighToLow = true;
//               }
//               if (isReservedLessons) {
//                 serviceLocator<StudentReservedLessonsParameters>()
//                     .sortPriceLowToHigh = null;
//                 serviceLocator<StudentReservedLessonsParameters>().sortDateFar =
//                     null;
//                 serviceLocator<StudentReservedLessonsParameters>()
//                     .sortDateNear = null;
//                 serviceLocator<StudentReservedLessonsParameters>()
//                     .sortPriceHighToLow = true;
//               }
//               if (isPreviousLessons) {
//                 serviceLocator<StudentPreviousLessonsParameters>()
//                     .sortPriceLowToHigh = null;
//                 serviceLocator<StudentPreviousLessonsParameters>().sortDateFar =
//                     null;
//                 serviceLocator<StudentPreviousLessonsParameters>()
//                     .sortDateNear = null;
//                 serviceLocator<StudentPreviousLessonsParameters>()
//                     .sortPriceHighToLow = true;
//               }
//             } else {
//               if (isAvailableLessons) {
//                 serviceLocator<TeacherCurrentLessonsParameters>()
//                     .sortPriceLowToHigh = null;
//                 serviceLocator<TeacherCurrentLessonsParameters>().sortDateFar =
//                     null;
//                 serviceLocator<TeacherCurrentLessonsParameters>().sortDateNear =
//                     null;
//                 serviceLocator<TeacherCurrentLessonsParameters>()
//                     .sortPriceHighToLow = true;
//               }
//               if (isPreviousLessons) {
//                 serviceLocator<TeacherPreviousLessonsParameters>()
//                     .sortPriceLowToHigh = null;
//                 serviceLocator<TeacherPreviousLessonsParameters>().sortDateFar =
//                     null;
//                 serviceLocator<TeacherPreviousLessonsParameters>()
//                     .sortDateNear = null;
//                 serviceLocator<TeacherPreviousLessonsParameters>()
//                     .sortPriceHighToLow = true;
//               }
//             }
//
//             onSort();
//           },
//           child: Text(
//             LocaleKeys.priceFromHighToLow.tr(),
//             style: getBoldBlack9Style(),
//           ),
//         ),
//         PopupMenuItem(
//           value: MenuItem.item2,
//           onTap: () {
//             if (isStudent) {
//               if (isAvailableLessons) {
//                 serviceLocator<StudentAvailableLessonsParameters>()
//                     .sortPriceLowToHigh = true;
//                 serviceLocator<StudentAvailableLessonsParameters>()
//                     .sortDateFar = null;
//                 serviceLocator<StudentAvailableLessonsParameters>()
//                     .sortDateNear = null;
//                 serviceLocator<StudentAvailableLessonsParameters>()
//                     .sortPriceHighToLow = null;
//               }
//               if (isReservedLessons) {
//                 serviceLocator<StudentReservedLessonsParameters>()
//                     .sortPriceLowToHigh = true;
//                 serviceLocator<StudentReservedLessonsParameters>().sortDateFar =
//                     null;
//                 serviceLocator<StudentReservedLessonsParameters>()
//                     .sortDateNear = null;
//                 serviceLocator<StudentReservedLessonsParameters>()
//                     .sortPriceHighToLow = null;
//               }
//               if (isPreviousLessons) {
//                 serviceLocator<StudentPreviousLessonsParameters>()
//                     .sortPriceLowToHigh = true;
//                 serviceLocator<StudentPreviousLessonsParameters>().sortDateFar =
//                     null;
//                 serviceLocator<StudentPreviousLessonsParameters>()
//                     .sortDateNear = null;
//                 serviceLocator<StudentPreviousLessonsParameters>()
//                     .sortPriceHighToLow = null;
//               }
//             } else {
//               if (isAvailableLessons) {
//                 serviceLocator<TeacherCurrentLessonsParameters>()
//                     .sortPriceLowToHigh = true;
//                 serviceLocator<TeacherCurrentLessonsParameters>().sortDateFar =
//                     null;
//                 serviceLocator<TeacherCurrentLessonsParameters>().sortDateNear =
//                     null;
//                 serviceLocator<TeacherCurrentLessonsParameters>()
//                     .sortPriceHighToLow = null;
//               }
//               if (isPreviousLessons) {
//                 serviceLocator<StudentPreviousLessonsParameters>()
//                     .sortPriceLowToHigh = true;
//                 serviceLocator<StudentPreviousLessonsParameters>().sortDateFar =
//                     null;
//                 serviceLocator<StudentPreviousLessonsParameters>()
//                     .sortDateNear = null;
//                 serviceLocator<StudentPreviousLessonsParameters>()
//                     .sortPriceHighToLow = null;
//               }
//             }
//             onSort();
//           },
//           child: Text(
//             LocaleKeys.priceFromLowToHigh.tr(),
//             style: getBoldBlack9Style(),
//           ),
//         ),
//         PopupMenuItem(
//           value: MenuItem.item3,
//           onTap: () {
//             if (isStudent) {
//               if (isAvailableLessons) {
//                 serviceLocator<StudentAvailableLessonsParameters>()
//                     .sortPriceLowToHigh = null;
//                 serviceLocator<StudentAvailableLessonsParameters>()
//                     .sortDateFar = null;
//                 serviceLocator<StudentAvailableLessonsParameters>()
//                     .sortDateNear = true;
//                 serviceLocator<StudentAvailableLessonsParameters>()
//                     .sortPriceHighToLow = null;
//               }
//               if (isReservedLessons) {
//                 serviceLocator<StudentReservedLessonsParameters>()
//                     .sortPriceLowToHigh = null;
//                 serviceLocator<StudentReservedLessonsParameters>().sortDateFar =
//                     null;
//                 serviceLocator<StudentReservedLessonsParameters>()
//                     .sortDateNear = true;
//                 serviceLocator<StudentReservedLessonsParameters>()
//                     .sortPriceHighToLow = null;
//               }
//               if (isPreviousLessons) {
//                 serviceLocator<StudentPreviousLessonsParameters>()
//                     .sortPriceLowToHigh = null;
//                 serviceLocator<StudentPreviousLessonsParameters>().sortDateFar =
//                     null;
//                 serviceLocator<StudentPreviousLessonsParameters>()
//                     .sortDateNear = true;
//                 serviceLocator<StudentPreviousLessonsParameters>()
//                     .sortPriceHighToLow = null;
//               }
//             } else {
//               if (isAvailableLessons) {
//                 serviceLocator<TeacherCurrentLessonsParameters>()
//                     .sortPriceLowToHigh = null;
//                 serviceLocator<TeacherCurrentLessonsParameters>().sortDateFar =
//                     null;
//                 serviceLocator<TeacherCurrentLessonsParameters>().sortDateNear =
//                     true;
//                 serviceLocator<TeacherCurrentLessonsParameters>()
//                     .sortPriceHighToLow = null;
//               }
//               if (isPreviousLessons) {
//                 serviceLocator<TeacherPreviousLessonsParameters>()
//                     .sortPriceLowToHigh = null;
//                 serviceLocator<TeacherPreviousLessonsParameters>().sortDateFar =
//                     null;
//                 serviceLocator<TeacherPreviousLessonsParameters>()
//                     .sortDateNear = true;
//                 serviceLocator<TeacherPreviousLessonsParameters>()
//                     .sortPriceHighToLow = null;
//               }
//             }
//
//             onSort();
//           },
//           child: Text(
//             LocaleKeys.dateFromNearToFare.tr(),
//             style: getBoldBlack9Style(),
//           ),
//         ),
//         PopupMenuItem(
//           value: MenuItem.item4,
//           onTap: () {
//             if (isStudent) {
//               if (isAvailableLessons) {
//                 serviceLocator<StudentAvailableLessonsParameters>()
//                     .sortPriceLowToHigh = null;
//                 serviceLocator<StudentAvailableLessonsParameters>()
//                     .sortDateFar = true;
//                 serviceLocator<StudentAvailableLessonsParameters>()
//                     .sortDateNear = null;
//                 serviceLocator<StudentAvailableLessonsParameters>()
//                     .sortPriceHighToLow = null;
//               }
//               if (isReservedLessons) {
//                 serviceLocator<StudentReservedLessonsParameters>()
//                     .sortPriceLowToHigh = null;
//                 serviceLocator<StudentReservedLessonsParameters>().sortDateFar =
//                     true;
//                 serviceLocator<StudentReservedLessonsParameters>()
//                     .sortDateNear = null;
//                 serviceLocator<StudentReservedLessonsParameters>()
//                     .sortPriceHighToLow = null;
//               }
//               if (isPreviousLessons) {
//                 serviceLocator<StudentPreviousLessonsParameters>()
//                     .sortPriceLowToHigh = null;
//                 serviceLocator<StudentPreviousLessonsParameters>().sortDateFar =
//                     true;
//                 serviceLocator<StudentPreviousLessonsParameters>()
//                     .sortDateNear = null;
//                 serviceLocator<StudentPreviousLessonsParameters>()
//                     .sortPriceHighToLow = null;
//               }
//             } else {
//               if (isAvailableLessons) {
//                 serviceLocator<TeacherCurrentLessonsParameters>()
//                     .sortPriceLowToHigh = null;
//                 serviceLocator<TeacherCurrentLessonsParameters>().sortDateFar =
//                     true;
//                 serviceLocator<TeacherCurrentLessonsParameters>().sortDateNear =
//                     null;
//                 serviceLocator<TeacherCurrentLessonsParameters>()
//                     .sortPriceHighToLow = null;
//               }
//               if (isPreviousLessons) {
//                 serviceLocator<TeacherPreviousLessonsParameters>()
//                     .sortPriceLowToHigh = null;
//                 serviceLocator<TeacherPreviousLessonsParameters>().sortDateFar =
//                     true;
//                 serviceLocator<TeacherPreviousLessonsParameters>()
//                     .sortDateNear = null;
//                 serviceLocator<TeacherPreviousLessonsParameters>()
//                     .sortPriceHighToLow = null;
//               }
//             }
//             onSort();
//           },
//           child: Text(
//             LocaleKeys.dateFromFareToNear.tr(),
//             style: getBoldBlack9Style(),
//           ),
//         ),
//         PopupMenuItem(
//           value: MenuItem.item5,
//           onTap: () {
//             if (isStudent) {
//               if (isAvailableLessons) {
//                 serviceLocator<StudentAvailableLessonsParameters>()
//                     .sortPriceLowToHigh = null;
//                 serviceLocator<StudentAvailableLessonsParameters>()
//                     .sortDateFar = null;
//                 serviceLocator<StudentAvailableLessonsParameters>()
//                     .sortDateNear = null;
//                 serviceLocator<StudentAvailableLessonsParameters>()
//                     .sortPriceHighToLow = null;
//               }
//               if (isReservedLessons) {
//                 serviceLocator<StudentReservedLessonsParameters>()
//                     .sortPriceLowToHigh = null;
//                 serviceLocator<StudentReservedLessonsParameters>().sortDateFar =
//                     null;
//                 serviceLocator<StudentReservedLessonsParameters>()
//                     .sortDateNear = null;
//                 serviceLocator<StudentReservedLessonsParameters>()
//                     .sortPriceHighToLow = null;
//               }
//               if (isPreviousLessons) {
//                 serviceLocator<StudentPreviousLessonsParameters>()
//                     .sortPriceLowToHigh = null;
//                 serviceLocator<StudentPreviousLessonsParameters>().sortDateFar =
//                     null;
//                 serviceLocator<StudentPreviousLessonsParameters>()
//                     .sortDateNear = null;
//                 serviceLocator<StudentPreviousLessonsParameters>()
//                     .sortPriceHighToLow = null;
//               }
//             } else {
//               if (isAvailableLessons) {
//                 serviceLocator<TeacherCurrentLessonsParameters>()
//                     .sortPriceLowToHigh = null;
//                 serviceLocator<TeacherCurrentLessonsParameters>().sortDateFar =
//                     null;
//                 serviceLocator<TeacherCurrentLessonsParameters>().sortDateNear =
//                     null;
//                 serviceLocator<TeacherCurrentLessonsParameters>()
//                     .sortPriceHighToLow = null;
//               }
//               if (isPreviousLessons) {
//                 serviceLocator<TeacherPreviousLessonsParameters>()
//                     .sortPriceLowToHigh = null;
//                 serviceLocator<TeacherPreviousLessonsParameters>().sortDateFar =
//                     null;
//                 serviceLocator<TeacherPreviousLessonsParameters>()
//                     .sortDateNear = null;
//                 serviceLocator<TeacherPreviousLessonsParameters>()
//                     .sortPriceHighToLow = null;
//               }
//             }
//             onSort();
//           },
//           child: Text(
//             LocaleKeys.resetButtonText.tr(),
//             style: getBoldBlack9Style(),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// enum MenuItem {
//   item1,
//   item2,
//   item3,
//   item4,
//   item5,
// }
