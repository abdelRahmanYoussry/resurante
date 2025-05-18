// ignore_for_file: file_names
// // ignore_for_file: file_names, prefer_const_constructors_in_immutables, deprecated_member_use
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:hassy/Features/home/presentation/manager/home_cubit.dart';
//
// import '../app/color_manager.dart';
// import '../app/font_manager.dart';
// import '../app/styles_manager.dart';
// import '../app/values_manager.dart';
// import '../components/components.dart';
//
// class ChangeStyleWidget extends StatelessWidget {
//   ChangeStyleWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<HomeCubit, HomeState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         var cubit = HomeCubit.get(context);
//         return Container(
//           width: MediaQuery.of(context).size.width / 2,
//           height: MediaQuery.of(context).size.height / AppSize.size12,
//           decoration: BoxDecoration(
//             color: ColorManager.mainPrimaryColor4,
//             borderRadius: BorderRadius.circular(
//               10.0,
//             ),
//           ),
//           child: InkWell(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 SizedBox(
//                   width: myMediaQuery(context: context).width / 3,
//                   child: Text(
//                     'Color Manger',
//                     style: getBoldStyle(
//                       color: Colors.white,
//                       fontSize: FontSize.size16.sp,
//                     ),
//                     textAlign: TextAlign.center,
//                     textScaleFactor: 1.0,
//                   ),
//                 ),
//                 const SizedBox(width: 5),
//                 Icon(
//                   FontAwesomeIcons.brush,
//                   color: Colors.white,
//                   size: 10.w,
//                 )
//               ],
//             ),
//             onTap: () {
//               showModalBottomSheet(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.vertical(
//                     top: Radius.circular(25.w),
//                   ),
//                 ),
//                 isDismissible: true,
//                 clipBehavior: Clip.antiAliasWithSaveLayer,
//                 useRootNavigator: false,
//                 context: context,
//                 builder: (context) {
//                   return StatefulBuilder(
//                     builder: (context, setState) {
//                       return Container(
//                         decoration: BoxDecoration(
//                           color: Theme.of(context).scaffoldBackgroundColor,
//                         ),
//                         clipBehavior: Clip.antiAliasWithSaveLayer,
//                         height: myMediaQuery(context: context).height / 3,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(top: 5.0),
//                                   child: TextButton(
//                                     style: ButtonStyle(
//                                         backgroundColor:
//                                             MaterialStateProperty.all(
//                                                 ColorManager.styleColor(
//                                                     changeColor: ColorManager
//                                                         .tealColor))),
//                                     onPressed: () async {
//                                       // CacheHelper.saveDataToSharedPreferences(
//                                       //     key: 'mainColor',
//                                       //     value: ColorManager.tealColor);
//                                       setState(() {
//                                         cubit.changeColorStyle(
//                                           color: ColorManager.tealColor,
//                                         );
//                                         // ColorManager.mainPrimaryColor4 =
//                                         //     ColorManager.tealColor;
//                                       });
//
//                                       Navigator.pop(context);
//                                     },
//                                     child: SizedBox(
//                                       width: 100.w,
//                                       child: Center(
//                                         child: Text(
//                                           'Teal',
//                                           style: getBoldStyle(
//                                             fontSize: 18.sp,
//                                             color: Colors.white,
//                                           ),
//                                           textScaleFactor: 1.0,
//                                           textAlign: TextAlign.center,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(top: 5.0),
//                                   child: TextButton(
//                                     style: ButtonStyle(
//                                       backgroundColor:
//                                           MaterialStateProperty.all(
//                                         ColorManager.styleColor(
//                                           changeColor: ColorManager.pinkColor,
//                                         ),
//                                       ),
//                                     ),
//                                     onPressed: () async {
//                                       // CacheHelper.saveDataToSharedPreferences(
//                                       //     key: 'mainColor',
//                                       //     value: ColorManager.pinkColor);
//                                       setState(() {
//                                         cubit.changeColorStyle(
//                                             color: ColorManager.pinkColor);
//                                       });
//                                       // cubit.changeColorStyle(
//                                       //     color: ColorManager.pinkColor);
//                                       Navigator.pop(context);
//                                     },
//                                     child: SizedBox(
//                                       width: 100.w,
//                                       child: Center(
//                                         child: Text(
//                                           'Pink',
//                                           style: getBoldStyle(
//                                             fontSize: 18.sp,
//                                             color: Colors.white,
//                                           ),
//                                           textScaleFactor: 1.0,
//                                           textAlign: TextAlign.center,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                     top: 5.0,
//                                     bottom: 5,
//                                   ),
//                                   child: TextButton(
//                                     style: ButtonStyle(
//                                         backgroundColor:
//                                             MaterialStateProperty.all(
//                                                 ColorManager.styleColor(
//                                                     changeColor: ColorManager
//                                                         .blueColor))),
//                                     onPressed: () async {
//                                       // CacheHelper.saveDataToSharedPreferences(
//                                       //     key: 'mainColor',
//                                       //     value: ColorManager.blueColor);
//                                       setState(() {
//                                         cubit.changeColorStyle(
//                                             color: ColorManager.blueColor);
//                                       });
//                                       // cubit.changeColorStyle(
//                                       //     color: ColorManager.blueColor);
//                                       Navigator.pop(context);
//                                     },
//                                     child: Center(
//                                       child: SizedBox(
//                                         width: 100.w,
//                                         child: Text(
//                                           'Blue',
//                                           style: getBoldStyle(
//                                             fontSize: 18.sp,
//                                             color: Colors.white,
//                                           ),
//                                           textScaleFactor: 1.0,
//                                           textAlign: TextAlign.center,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(top: 5.0),
//                                   child: TextButton(
//                                     style: ButtonStyle(
//                                       backgroundColor:
//                                           MaterialStateProperty.all(
//                                         ColorManager.styleColor(
//                                           changeColor: ColorManager.purpleColor,
//                                         ),
//                                       ),
//                                     ),
//                                     onPressed: () async {
//                                       // CacheHelper.saveDataToSharedPreferences(
//                                       //     key: 'mainColor',
//                                       //     value: ColorManager.purpleColor);
//                                       setState(() {
//                                         cubit.changeColorStyle(
//                                             color: ColorManager.purpleColor);
//                                       });
//                                       // cubit.changeColorStyle(
//                                       //     color: ColorManager.purpleColor);
//                                       Navigator.pop(context);
//                                     },
//                                     child: Center(
//                                       child: SizedBox(
//                                         width: 100.w,
//                                         child: Text(
//                                           'Purple',
//                                           style: getBoldStyle(
//                                             fontSize: 18.sp,
//                                             color: Colors.white,
//                                           ),
//                                           textScaleFactor: 1.0,
//                                           textAlign: TextAlign.center,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(top: 5.0),
//                                   child: TextButton(
//                                     style: ButtonStyle(
//                                         backgroundColor:
//                                             MaterialStateProperty.all(
//                                                 ColorManager.styleColor(
//                                                     changeColor: ColorManager
//                                                         .greenColor))),
//                                     onPressed: () async {
//                                       // CacheHelper.saveDataToSharedPreferences(
//                                       //     key: 'mainColor',
//                                       //     value: ColorManager.greenColor);
//                                       setState(() {
//                                         cubit.changeColorStyle(
//                                             color: ColorManager.greenColor);
//                                       });
//                                       // cubit.changeColorStyle(
//                                       //     color: ColorManager.greenColor);
//                                       Navigator.pop(context);
//                                     },
//                                     child: Center(
//                                       child: SizedBox(
//                                         width: 100.w,
//                                         child: Text(
//                                           'Green',
//                                           style: getBoldStyle(
//                                             fontSize: 18.sp,
//                                             color: Colors.white,
//                                           ),
//                                           textScaleFactor: 1.0,
//                                           textAlign: TextAlign.center,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       top: 5.0, bottom: 5),
//                                   child: TextButton(
//                                     style: ButtonStyle(
//                                         backgroundColor:
//                                             MaterialStateProperty.all(
//                                                 ColorManager.styleColor(
//                                                     changeColor: ColorManager
//                                                         .orangeColor))),
//                                     onPressed: () async {
//                                       // CacheHelper.saveDataToSharedPreferences(
//                                       //     key: 'mainColor',
//                                       //     value: ColorManager.orangeColor);
//                                       setState(() {
//                                         cubit.changeColorStyle(
//                                             color: ColorManager.orangeColor);
//                                       });
//                                       // cubit.changeColorStyle(
//                                       //     color: ColorManager.orangeColor);
//                                       Navigator.pop(context);
//                                     },
//                                     child: Center(
//                                       child: SizedBox(
//                                         width: 100.w,
//                                         child: Text(
//                                           'Orange',
//                                           style: getBoldStyle(
//                                             fontSize: 18.sp,
//                                             color: Colors.white,
//                                           ),
//                                           textScaleFactor: 1.0,
//                                           textAlign: TextAlign.center,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   );
//                 },
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
