// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../app/color_manager.dart';
//
// class SettingLanguageWidget extends StatelessWidget {
//   SettingLanguageWidget({
//     super.key,
//     required BuildContext context,
//     this.labelColor = Colors.white,
//     required this.isStudent,
//   });
//   List lang = ['en', 'العربية'];
//   final bool isStudent;
//   Color? labelColor;
//
//   @override
//   Widget build(BuildContext context) {
//     //abdo
//     return BlocProvider(
//       create: (context) => serviceLocator<OnBoardingCubit>(),
//       child: BlocConsumer<OnBoardingCubit, OnBoardingStates>(
//         listener: (context, state) {
//           if (state is LocalChangedSuccessState) {
//             context.setLocale(state.selectedLocale);
//             navigateAndFinish(context, routeName: Routes.splashRoute);
//           }
//         },
//         buildWhen: (previous, current) => previous != current,
//         builder: (context, state) {
//           final cubit = OnBoardingCubit.get(context);
//           debugPrint(cubit.currentLangCode);
//           debugPrint(context.locale.toString());
//           return Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       LocaleKeys.languageText.tr(),
//                       style: getBoldBlack13Style(),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 30.h,
//                 ),
//                 InkWell(
//                   splashColor: Colors.transparent,
//                   highlightColor: Colors.transparent,
//                   onTap: () {
//                     cubit.changeLocalLan(
//                       const ChangeLanguageParameters(
//                         local: Locale('ar'),
//                       ),
//                       context,
//                       isStudent,
//                     );
//                   },
//                   child: Row(
//                     children: [
//                       Text(
//                         'العربية',
//                         style: getMediumBlack12Style(),
//                         textAlign: TextAlign.center,
//                         // textScaleFactor: 1.0,
//                       ),
//                       const Spacer(),
//                       InkWell(
//                         splashColor: Colors.transparent,
//                         highlightColor: Colors.transparent,
//                         onTap: () {
//                           cubit.changeLocalLan(
//                             const ChangeLanguageParameters(
//                               local: Locale('ar'),
//                             ),
//                             context,
//                             isStudent,
//                           );
//                         },
//                         child: context.locale == const Locale('ar')
//                             ? Container(
//                                 width: 24.w,
//                                 height: 24.h,
//                                 clipBehavior: Clip.antiAlias,
//                                 decoration: ShapeDecoration(
//                                   shape: RoundedRectangleBorder(
//                                     side: BorderSide(
//                                       width: 2,
//                                       color: ColorManager.mainBlue,
//                                     ),
//                                     borderRadius: BorderRadius.circular(18),
//                                   ),
//                                 ),
//                                 child: Stack(
//                                   children: [
//                                     Center(
//                                       child: Container(
//                                         width: 14.w,
//                                         height: 14.h,
//                                         decoration: ShapeDecoration(
//                                           color: ColorManager.mainBlue,
//                                           shape: const OvalBorder(),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               )
//                             : Container(
//                                 width: 24,
//                                 height: 24,
//                                 clipBehavior: Clip.antiAlias,
//                                 decoration: ShapeDecoration(
//                                   shape: RoundedRectangleBorder(
//                                     side: BorderSide(
//                                       width: 2,
//                                       color: ColorManager.textGrey,
//                                     ),
//                                     borderRadius: BorderRadius.circular(18),
//                                   ),
//                                 ),
//                               ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const MyCustomDividerSize5(),
//                 InkWell(
//                   splashColor: Colors.transparent,
//                   highlightColor: Colors.transparent,
//                   onTap: () {
//                     cubit.changeLocalLan(
//                       const ChangeLanguageParameters(
//                         local: Locale('en'),
//                       ),
//                       context,
//                       isStudent,
//                     );
//                   },
//                   child: Row(
//                     children: [
//                       Text(
//                         'English',
//                         style: getMediumBlack12Style(),
//                         textAlign: TextAlign.center,
//                         // textScaleFactor: 1.0,
//                       ),
//                       const Spacer(),
//                       InkWell(
//                         splashColor: Colors.transparent,
//                         highlightColor: Colors.transparent,
//                         onTap: () {
//                           cubit.changeLocalLan(
//                             const ChangeLanguageParameters(
//                               local: Locale('en'),
//                             ),
//                             context,
//                             isStudent,
//                           );
//                         },
//                         child: context.locale == const Locale('en')
//                             ? Container(
//                                 width: 24.w,
//                                 height: 24.h,
//                                 clipBehavior: Clip.antiAlias,
//                                 decoration: ShapeDecoration(
//                                   shape: RoundedRectangleBorder(
//                                     side: BorderSide(
//                                       width: 2,
//                                       color: ColorManager.mainBlue,
//                                     ),
//                                     borderRadius: BorderRadius.circular(18),
//                                   ),
//                                 ),
//                                 child: Stack(
//                                   children: [
//                                     Center(
//                                       child: Container(
//                                         width: 14.w,
//                                         height: 14.h,
//                                         decoration: ShapeDecoration(
//                                           color: ColorManager.mainBlue,
//                                           shape: const OvalBorder(),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               )
//                             : Container(
//                                 width: 24,
//                                 height: 24,
//                                 clipBehavior: Clip.antiAlias,
//                                 decoration: ShapeDecoration(
//                                   shape: RoundedRectangleBorder(
//                                     side: BorderSide(
//                                       width: 2,
//                                       color: ColorManager.textGrey,
//                                     ),
//                                     borderRadius: BorderRadius.circular(18),
//                                   ),
//                                 ),
//                               ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
