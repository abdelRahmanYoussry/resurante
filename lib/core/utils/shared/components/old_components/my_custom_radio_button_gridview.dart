// // ignore_for_file: must_be_immutable, avoid_print
//
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../app/color_manager.dart';
// import '../../app/values_manager.dart';
// import '../../translations/locale_keys.g.dart';
// import '../../widgets/elevatedButton.dart';
// import '../components.dart';
//
// class MyCustomRadioButton extends StatelessWidget {
//   MyCustomRadioButton({
//     Key? key,
//     required this.selectedIndexList,
//     required this.backGroundColor,
//     required this.textColor,
//     required this.borderColor,
//     // required this.isChecked,
//     // required this.onCheckBoxChange,
//     this.centerWidget,
//     this.height = AppSize.size150,
//     required this.myRoute,
//   }) : super(key: key);
//   List selectedIndexList = [];
//   double height;
//   Color backGroundColor;
//   Color textColor;
//   Color borderColor;
//   Widget? centerWidget;
//   Function? onCheckBoxChange;
//   String myRoute;
//
//   @override
//   Widget build(BuildContext context) {
//     var onBoardingCubit = OnBoardingCubit.get(context);
//     return BlocConsumer<OnBoardingCubit, OnBoardingStates>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         var cubit = OnBoardingCubit.get(context);
//         return Scaffold(
//           appBar: CustomAppBar(
//             routeName: myRoute,
//             mycolor: ColorManager.mainPrimaryColor2,
//             title: Text(LocaleKeys.educationMaterial.tr()),
//             isLeading: true,
//             toolBarHeight: myMediaQuery(context: context).height / 14,
//           ),
//           body: SingleChildScrollView(
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 GridView.builder(
//                   physics: const BouncingScrollPhysics(),
//                   shrinkWrap: true,
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 1,
//                     mainAxisSpacing: 1,
//                     mainAxisExtent: 30,
//                   ),
//                   scrollDirection: Axis.vertical,
//                   itemCount: selectedIndexList.length,
//                   itemBuilder: (context, index) {
//                     return Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Radio(
//                           value: index,
//                           activeColor: ColorManager.mainPrimaryColor3,
//                           onChanged: (value) {
//                             cubit.changeRadioButtonValue(index: index);
//                           },
//                           groupValue: cubit.myRadioIndex,
//                         ),
//                         Expanded(
//                           child: Text(
//                             selectedIndexList[index].toString(),
//                             style: getBoldBlack24Style(
//                                 // color: ColorManager.textFormBorderColor,
//                                 // fontSize: FontSize.size16
//
//                                 ),
//                             // softWrap: true,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         )
//                       ],
//                     );
//                   },
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 cubit.isFilePicked && onBoardingCubit.myRadioIndex < 0
//                     ? Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               LocaleKeys.radioButtonErrorText.tr(),
//                               style: TextStyle(color: ColorManager.error),
//                             ),
//                           ],
//                         ),
//                       )
//                     : const SizedBox(),
//                 Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: MyElevatedButton(
//                     height: myMediaQuery(context: context).height / 10,
//                     width: myMediaQuery(context: context).width / 3,
//                     borderWidth: AppSize.size2,
//                     radius: AppSize.size10,
//                     fontSize: AppSize.size18,
//                     onTap: cubit.myRadioIndex >= 0
//                         ? () {
//                             Navigator.pop(context);
//                           }
//                         : () {
//                             cubit.changeFilePickedBool(
//                                 isPicked: cubit.isFilePicked);
//                           },
//                     buttonName: LocaleKeys.confirmButton.tr(),
//                     borderColor: ColorManager.mainPrimaryColor4,
//                     buttonColor: ColorManager.mainPrimaryColor4,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
//
// /*/
// class MyCustomRadioButton extends StatelessWidget {
//   MyCustomRadioButton({
//     Key? key,
//     required this.selectedIndexList,
//     required this.backGroundColor,
//     required this.textColor,
//     required this.borderColor,
//     // required this.isChecked,
//     // required this.onCheckBoxChange,
//     this.centerWidget,
//     this.height = AppSize.size150,
//   }) : super(key: key);
//   List selectedIndexList = [];
//   double height;
//   Color backGroundColor;
//   Color textColor;
//   Color borderColor;
//   Widget? centerWidget;
//   Function? onCheckBoxChange;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<OnBoardingCubit, OnBoardingStates>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         var cubit = OnBoardingCubit.get(context);
//         return Container(
//           height: height,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(AppSize.size10),
//             color: backGroundColor,
//             border: Border.all(color: borderColor, width: 2),
//           ),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 if (centerWidget != null)
//                   Padding(
//                     padding: const EdgeInsets.only(top: 5.0),
//                     child: centerWidget!,
//                   ),
//                 GridView.builder(
//                   physics: const BouncingScrollPhysics(),
//                   shrinkWrap: true,
//                   padding: const EdgeInsets.only(
//                     top: AppPadding.padding5,
//                     bottom: AppPadding.padding5,
//                     right: 1,
//                   ),
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     mainAxisSpacing: 1,
//                     mainAxisExtent: 30,
//                   ),
//                   scrollDirection: Axis.vertical,
//                   itemCount: selectedIndexList.length,
//                   itemBuilder: (context, index) {
//                     return Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Radio(
//                           value: index,
//                           activeColor: ColorManager.mainPrimaryColor3,
//                           onChanged: (value) {
//                             cubit.changeRadioButtonValue(index: index);
//                           },
//                           groupValue: cubit.myRadioIndex,
//                         ),
//                         Expanded(
//                           child: Text(
//                             selectedIndexList[index].toString(),
//                             style: getBoldStyle(
//                                 color: ColorManager.textFormBorderColor,
//                                 fontSize: FontSize.size16),
//                             // softWrap: true,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         )
//                       ],
//                     );
//                   },
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
//  */
