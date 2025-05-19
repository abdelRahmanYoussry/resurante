// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:resturente/core/utils/shared/app/color_manager.dart';
// import 'package:resturente/core/utils/shared/widgets/searchable_text_form_feild.dart';
// import 'package:resturente/core/utils/shared/widgets/svg_widget.dart';
// import 'package:resturente/core/utils/shared/widgets/textFormfield.dart';
//
// import '../app/assets_manager.dart';
// import '../app/styles_manager.dart';
// import '../translations/locale_keys.g.dart';
// import 'custom_app_bar.dart';
//
// class CustomAppBarWithImage extends StatefulWidget
//     implements PreferredSizeWidget {
//   CustomAppBarWithImage({
//     super.key,
//     // required this.userData,
//     required this.searchController,
//     required this.isStudent,
//     required this.appBarHeight,
//     required this.onFilter,
//     required this.onSort,
//     required this.isReservedLessons,
//     required this.isPreviousLessons,
//     required this.isAvailableLessons,
//     this.isHomeScreen = true,
//     this.showFilter = true,
//     this.showSort = true,
//     this.textFormField,
//     this.title = '',
//     this.selectedMaterial,
//   });
//
//   // final UserDataEntity userDataEntity;
//   // final UserData userData;
//   final TextEditingController searchController;
//   final bool isHomeScreen;
//   final bool showFilter;
//   final bool showSort;
//   final bool isStudent;
//   final String title;
//   final double appBarHeight;
//   final Function onFilter;
//
//   final Function onSort;
//   final bool isAvailableLessons;
//   final bool isReservedLessons;
//   final bool isPreviousLessons;
//   final Widget? textFormField;
//   String? selectedMaterial = '';
//
//   @override
//   State<CustomAppBarWithImage> createState() => _CustomAppBarWithImageState();
//
//   @override
//   // TODO: implement preferredSize
//   Size get preferredSize => throw UnimplementedError();
// }
//
// class _CustomAppBarWithImageState extends State<CustomAppBarWithImage> {
//   // List<FilterClassesData>? searchData;
//
//   Size get preferredSize => throw UnimplementedError();
//
//   bool isTapped = false;
//
//   @override
//   Widget build(BuildContext context) {
//     if (widget.isHomeScreen) {
//       return CustomAppBar(
//         mycolor: ColorManager.transparentColor,
//         title: Text(
//           widget.title,
//           style: getBoldWhite12Style(),
//         ),
//         systemUiOverlayStyle: const SystemUiOverlayStyle(
//           statusBarIconBrightness: Brightness.light,
//         ),
//         isLeading: false,
//         toolBarHeight: widget.appBarHeight,
//         flexibleSpace: Stack(
//           fit: StackFit.expand,
//           children: [
//             Container(
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   fit: BoxFit.fill,
//                   image: AssetImage(
//                     ImageAssets.hassyBackgroundImage,
//                   ),
//                 ),
//               ),
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                   child: Row(
//                     children: [
//                       // InkWell(
//                       //   onTap: () {},
//                       //   child: ClipOval(
//                       //     child: widget.userData.userImagePath == null
//                       //         ? Image(
//                       //             width: 41.w,
//                       //             height: 41.h,
//                       //             fit: BoxFit.cover,
//                       //             image: const AssetImage(
//                       //               ImageAssets.userAvatar1,
//                       //             ),
//                       //           )
//                       //         : MyCachedNetworkImage(
//                       //             url: widget.userData.userImagePath!,
//                       //             height: 32.h,
//                       //             width: 32.h,
//                       //           ),
//                       //   ),
//                       // ),
//                       SizedBox(
//                         width: 8.w,
//                       ),
//                       // Expanded(
//                       //   child: Text(
//                       //     widget.userData.userName!,
//                       //     style: getMediumWhite16Style().copyWith(
//                       //       overflow: TextOverflow.ellipsis,
//                       //     ),
//                       //   ),
//                       // ),
//                       const Spacer(),
//                       InkWell(
//                         onTap: () {},
//                         child: Row(
//                           children: [
//                             SvgPicture.asset(ImageAssets.locationIcon),
//                             // Padding(
//                             //   padding: const EdgeInsets.only(left: 5),
//                             //   child: Text(
//                             //     widget.userData.cityName!.length > 3
//                             //         ? widget.userData.cityName!
//                             //         : LocaleKeys.noCity.tr(),
//                             //     style: getBoldWhite14Style(
//                             //         // color: ColorManager.white,
//                             //         // fontSize: 30,
//                             //         ),
//                             //   ),
//                             // ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 25.h,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(bottom: 15.0.h),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       if (widget.showFilter)
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 8.0.w),
//                           child: GestureDetector(
//                             child: SvgPicture.asset(ImageAssets.filterIcon),
//                             onTap: () {
//                               widget.onFilter();
//                             },
//                           ),
//                         ),
//                       widget.textFormField == null
//                           ? const Expanded(
//                               child: SearchableTextFormFeild(),
//                             )
//                           : widget.textFormField!,
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       );
//     } else {
//       return CustomAppBar(
//         mycolor: ColorManager.transparentColor,
//         title: const Text(''),
//         systemUiOverlayStyle: const SystemUiOverlayStyle(
//           statusBarIconBrightness: Brightness.light,
//         ),
//         isLeading: false,
//         toolBarHeight: widget.appBarHeight,
//         flexibleSpace: Stack(
//           fit: StackFit.expand,
//           children: [
//             Container(
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                   image: DecorationImage(
//                       fit: BoxFit.fill,
//                       image: AssetImage(
//                         ImageAssets.hassyBackgroundImage,
//                       ))),
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(bottom: 25.0.h),
//                   child: Text(
//                     widget.title,
//                     style: getMediumWhite20Style(),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(bottom: 15.0.h),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       IconButton(
//                           onPressed: () async {
//                             widget.onFilter();
//                             // filterBottomSheet(context: context);
//                           },
//                           icon: Icon(
//                             Icons.filter_alt,
//                             size: 35,
//                             color: ColorManager.backGroundColor,
//                           )),
//                       Expanded(
//                         child: MyTextFormField(
//                           readOnly: false,
//                           control: widget.searchController,
//                           type: TextInputType.text,
//                           contentPadding: 0,
//                           onTap: () {},
//                           onChanged: (value) {},
//                           onSubmit: (value) {},
//                           prefix: const SvgWidget(
//                             imagePath: ImageAssets.searchIcon,
//                           ),
//                           hint: widget.isHomeScreen && widget.isStudent
//                               ? LocaleKeys.findYourClass.tr()
//                               : LocaleKeys.searchButton.tr(),
//                           hintStyle: getRegularGray16Style(),
//                           alignLabelWithHint: true,
//                           isPassword: false,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       );
//     }
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
