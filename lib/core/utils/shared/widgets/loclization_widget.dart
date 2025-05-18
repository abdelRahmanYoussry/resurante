// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
//
// class ChangeLanguageWidget extends StatelessWidget {
//   ChangeLanguageWidget({
//     Key? key,
//     required BuildContext context,
//     this.labelColor = Colors.white,
//   }) : super(key: key);
//   final List lang = ['en', 'العربية'];
//
//   final Color? labelColor;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<OnBoardingCubit, OnBoardingStates>(
//       listener: (context, state) {
//         if (state is LocalChangedSuccessState) {
//           context.setLocale(state.selectedLocale);
//         }
//       },
//       buildWhen: (previous, current) => previous != current,
//       builder: (context, state) {
//         final cubit = OnBoardingCubit.get(context);
//         return InkWell(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               context.locale == Locale('ar') ? 'English' : 'العربية',
//               style: getBoldBlack14Style().copyWith(color: labelColor),
//               textAlign: TextAlign.center,
//               // textScaleFactor: 1.0,
//             ),
//           ),
//           onTap: () {
//             showModalBottomSheet(
//               isDismissible: true,
//               useRootNavigator: false,
//               backgroundColor: Colors.red,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.vertical(
//                   top: Radius.circular(25.w),
//                 ),
//               ),
//               clipBehavior: Clip.antiAliasWithSaveLayer,
//               context: context,
//               builder: (context) {
//                 return StatefulBuilder(
//                   builder: (context, setState) {
//                     return Container(
//                       color: Theme.of(context).scaffoldBackgroundColor,
//                       height: 150.h,
//                       width: double.infinity,
//                       child: Column(
//                         // mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           TextButton(
//                             style: ButtonStyle(
//                               backgroundColor: context.locale.languageCode == 'en'
//                                   ? WidgetStateProperty.all(
//                                       ColorManager.mainPrimaryColor4,
//                                     )
//                                   : WidgetStateProperty.all(
//                                       Colors.transparent,
//                                     ),
//                             ),
//                             onPressed: () {
//                               cubit.changeLocalLan(
//                                 const ChangeLanguageParameters(
//                                   local: Locale('en'),
//                                 ),
//                                 context,
//                                 false,
//                               );
//                               Navigator.pop(context);
//                             },
//                             child: Text(
//                               'English',
//                               style: context.locale.languageCode == 'en'
//                                   ? getBoldBlack16Style().copyWith(color: ColorManager.white)
//                                   : Theme.of(context).textTheme.titleLarge,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 25.h,
//                           ),
//                           TextButton(
//                             style: ButtonStyle(
//                                 backgroundColor: context.locale.languageCode == 'ar'
//                                     ? WidgetStateProperty.all(ColorManager.mainPrimaryColor4)
//                                     : WidgetStateProperty.all(Colors.transparent)),
//                             onPressed: () {
//                               cubit.changeLocalLan(
//                                 const ChangeLanguageParameters(
//                                   local: Locale('ar'),
//                                 ),
//                                 context,
//                                 false,
//                               );
//                               Navigator.pop(context);
//                             },
//                             child: Text('العربية',
//                                 style: context.locale.languageCode == 'ar'
//                                     ? Theme.of(context).textTheme.titleLarge!.copyWith(color: ColorManager.white)
//                                     : Theme.of(context).textTheme.titleLarge!.copyWith(color: ColorManager.black)),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             );
//           },
//         );
//       },
//     );
//   }
// }
